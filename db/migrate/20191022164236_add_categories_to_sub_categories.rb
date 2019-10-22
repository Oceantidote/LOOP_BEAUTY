class AddCategoriesToSubCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :sub_categories, :category, foreign_key: true
  end
end
