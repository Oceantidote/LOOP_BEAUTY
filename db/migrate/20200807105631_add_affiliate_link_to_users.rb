class AddAffiliateLinkToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :affiliate_code, :string
    add_column :users, :affiliate_link, :string
    add_index :users, :affiliate_code
  end
end
