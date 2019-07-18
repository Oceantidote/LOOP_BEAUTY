class AddDescriptionToLookbooks < ActiveRecord::Migration[5.2]
  def change
    add_column :lookbooks, :description, :text
  end
end
