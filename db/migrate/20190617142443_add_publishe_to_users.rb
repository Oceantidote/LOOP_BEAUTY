class AddPublisheToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :published, :boolean, default: false
  end
end
