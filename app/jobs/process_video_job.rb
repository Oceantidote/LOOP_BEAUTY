class ProcessVideoJob < ApplicationJob
  queue_as :default

  def perform(id)
    tut = Tutorial.find(id.to_i)
    filename = tut.video.filename.base
    old = Tempfile.new([filename, ".#{tut.video.filename.extension}"], "#{Rails.root}/tmp")
    File.open(old, 'wb') { |file| file.write(tut.video.download) }
    convert = Tempfile.new([filename, '.webm'], "#{Rails.root}/tmp")
    movie = FFMPEG::Movie.new(old.path)
    movie.transcode(convert.path, { video_codec: 'libvpx-vp9', video_bitrate: 1000 }) do |progress|
      tut.update_column(:progress, (progress * 100).round(1))
      puts "#{filename} conversion progress: #{(progress * 100).round(1)}% done"
    end
    tut.video.attach(io: convert, filename: "#{filename}.webm", content_type: 'video/webm')
    tut.processing = false
    tut.progress = 0
    tut.save
    old.unlink
    convert.unlink
  end
end
