class RemoveAffiliateCodeFromBasketProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :basket_products, :affiliate_code, :string
  end
end
