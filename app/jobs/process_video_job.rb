class ProcessVideoJob < ApplicationJob
  queue_as :default

  def perform(id)
    tut = Tutorial.find(id.to_i)
    filename = tut.video.filename.base
    old = Tempfile.new([filename, ".#{tut.video.filename.extension}"], "#{Rails.root}/tmp")
    File.open(old, 'wb') { |file| file.write(tut.video.download) }
    convert = Tempfile.new([filename, ".#{tut.video.filename.extension}"], "#{Rails.root}/tmp")
    movie = FFMPEG::Movie.new(old.path)
    movie.transcode(convert.path, { video_bitrate: 1500 }) do |progress|
      tut.update_column(:progress, (progress * 100).round(1))
      puts "#{filename} conversion progress: #{(progress * 100).round(1)}% done"
    end
    tut.video.attach(io: convert, filename: "#{filename}.#{tut.video.filename.extension}", content_type: tut.video.content_type)
    p tut.video.filename.base
    tut.update_column(:processing, false)
    tut.update_column(:progress, 0)
    tut.save
    old.unlink
    convert.unlink
  end
end
