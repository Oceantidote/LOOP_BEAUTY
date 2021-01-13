class AddUsStockToShade < ActiveRecord::Migration[5.2]
  def change
    add_column :shades, :us_number_in_stock, :integer, default: 0
  end
end
