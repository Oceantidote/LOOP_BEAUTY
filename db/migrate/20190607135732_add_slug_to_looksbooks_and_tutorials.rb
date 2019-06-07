class AddSlugToLooksbooksAndTutorials < ActiveRecord::Migration[5.2]
  def change
    add_column :lookbooks, :slug, :string
    add_column :tutorials, :slug, :string
  end
end
