class CreateHomeBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :home_banners do |t|
      t.string :content
      t.string :link
      t.string :link_text
      t.boolean :display, default: false

      t.timestamps
    end
  end
end
