class AddAffiliateLinkToTutorials < ActiveRecord::Migration[5.2]
  def change
    add_column :tutorials, :affiliate_code, :string
    add_index :tutorials, :affiliate_code
  end
end
