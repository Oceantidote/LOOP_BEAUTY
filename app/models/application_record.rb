class ApplicationRecord < ActiveRecord::Base

  self.abstract_class = true

  UNIQUE_VIEWPORTS = {
   :iphone_se=>{:width=>320, :height=>568},
   :iphone_11_pro_max=>{:width=>414, :height=>896},
   :iphone_11_pro=>{:width=>375, :height=>812},
   :iphone_8_plus=>{:width=>414, :height=>736},
   :iphone_8=>{:width=>375, :height=>667},
   :ipad_pro=>{:width=>1024, :height=>1366},
   :ipad_third__fourth_generation=>{:width=>768, :height=>1024},
   :nexus_6p=>{:width=>411, :height=>731},
   :google_pixel_2_xl=>{:width=>411, :height=>823},
   :samsung_galaxy_note_5=>{:width=>480, :height=>853},
   :samsung_galaxy_s9=>{:width=>360, :height=>740},
   :samsung_galaxy_s7=>{:width=>360, :height=>640},
   :nexus_7=>{:width=>600, :height=>960},
   :samsung_galaxy_tab_10=>{:width=>800, :height=>1280},
   :chromebook_pixel=>{:width=>1280, :height=>850}
 }

  def viewport_array_ordered_by_width
    UNIQUE_VIEWPORTS.map{ |v| [v[0], v[1][:width], v[1][:height] ]}.sort_by{|v| v[2]}
  end


  def unique_viewports
    UNIQUE_VIEWPORTS
  end

  def self.unique_symbols_array
    UNIQUE_VIEWPORTS.keys
  end

  private

  # METHOD TO REGENRATE UNIQUE_VIEWPORTS HASH
  # WHEN NEW SCREEN_DIMENSIONS KEY VALUE PAIRS ARE ADDED
  # JUST A HELPFUL METHOD NOT ACTUALLY NEEDED BY APP

  # def self.generate_unique_viewports
  #   unique = {}
  #   SCREEN_DIMENSIONS.each do |device, screen|
  #     unique[device.to_s.downcase.gsub(" ","_").delete("(&%))").to_sym] = screen if !unique.values.include?(screen)
  #   end
  #   unique
  # end


end
































