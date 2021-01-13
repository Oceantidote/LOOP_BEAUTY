class AddUsPriceCentsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :us_price_cents, :integer, default: 0
  end
end
