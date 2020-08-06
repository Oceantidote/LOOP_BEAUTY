class ApplicationRecord < ActiveRecord::Base

  self.abstract_class = true

  UNIQUE_VIEWPORTS = {
    iphone_se:{ width: 320, height: 568, browser: 116 },
    samsung_galaxy_s7: { width: 360, height: 640, browser: 80},
    samsung_galaxy_s9:{ width: 360, height: 740, browser: 128},
    iphone_8:{ width: 375, height: 667, browser: 116},
    iphone_11_pro:{ width: 375, height: 812, browser: 174},
    pixel_3: { width: 392, height: 786, browser: 128 },
    pixel_3a: { width: 393, height: 808, browser: 128 },
    pixel_4: { width: 393, height: 830, browser: 103 },
    nexus_6p_pixel_1_2:{ width: 412, height: 732, browser: 128 },
    iphone_8_plus: { width: 414, height: 736, browser: 116 },
    googel_pixel_4_xl: {width: 412, height: 869, browser: 100 },
    iphone_11_pro_max: { width: 414, height: 896, browser: 174 },
    google_pixel_2_xl: { width: 411, height: 823, browser: 128 },
    google_pixel_3_xl: { width: 412, height: 846, browser: 153 },
    google_pixel_3a_xl: { width: 432, height: 864, browser: 128 },
    samsung_galaxy_note_5: { width: 480, height: 853, browser: 128},
    nexus_7: { width: 600, height: 960, browser: 168 },
    ipad_third__fourth_generation: { width: 768, height: 1024, browser: 109},
    ipad_7: { width: 810, height: 1080, browser: 109 },
    ipad_air: { width: 834, height: 1112, browser: 109 },
    ipad_11: { width: 834, height: 1194, browser: 113 },
    samsung_galaxy_tab_10:{ width: 800, height: 1280, browser: 120},
    ipad_pro:{ width: 1024, height: 1366, browser: 113 },
    chromebook_pixel:{ width: 1280, height: 850, browser: 120 }
  }

  def viewport_array_ordered_by_width
    UNIQUE_VIEWPORTS.map{ |v| [v[0], v[1][:width], v[1][:height]]}
  end

  def self.ordered_breakpoints
    UNIQUE_VIEWPORTS.map { |key,v| [v[:width], v[:height]] }
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































