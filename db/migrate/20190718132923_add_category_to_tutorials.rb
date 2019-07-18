class AddCategoryToTutorials < ActiveRecord::Migration[5.2]
  def change
    add_column :tutorials, :category, :string
  end
end
