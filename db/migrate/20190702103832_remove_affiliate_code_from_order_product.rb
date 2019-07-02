class RemoveAffiliateCodeFromOrderProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_products, :affiliate_code, :string
  end
end
