class AddAffiliateCodeToOrderProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :affiliate_code, :string
  end
end
