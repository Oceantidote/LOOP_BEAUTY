class AddSkuToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :sku, :string
  end
end
