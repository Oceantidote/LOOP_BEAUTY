class AddAffiliateLinkToLookbooks < ActiveRecord::Migration[5.2]
  def change
    add_column :lookbooks, :affiliate_code, :string
    add_index :lookbooks, :affiliate_code
  end
end
