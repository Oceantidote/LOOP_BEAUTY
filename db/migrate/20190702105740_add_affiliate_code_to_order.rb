class AddAffiliateCodeToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :affiliate_code, :string
  end
end
