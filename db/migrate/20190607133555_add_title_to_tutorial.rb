class AddTitleToTutorial < ActiveRecord::Migration[5.2]
  def change
    add_column :tutorials, :title, :string
  end
end
