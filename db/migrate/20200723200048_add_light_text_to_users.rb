class AddLightTextToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :light_text, :boolean, default: false
  end
end
