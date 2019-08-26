class CreateOfferBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :offer_banners do |t|
      t.string :content

      t.timestamps
    end
  end
end
