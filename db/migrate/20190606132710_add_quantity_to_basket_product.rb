class AddQuantityToBasketProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :basket_products, :quantity, :integer, default: 1
  end
end
