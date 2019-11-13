class AddTextColorToHomeBanners < ActiveRecord::Migration[5.2]
  def change
    add_column :home_banners, :text_color, :string
  end
end
