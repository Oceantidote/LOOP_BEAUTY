class AddProcessingToTutorial < ActiveRecord::Migration[5.2]
  def change
    add_column :tutorials, :processing, :boolean, default: true
  end
end
