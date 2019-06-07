class AddAltTagToLookbooks < ActiveRecord::Migration[5.2]
  def change
    add_column :lookbooks, :title, :string
  end
end
