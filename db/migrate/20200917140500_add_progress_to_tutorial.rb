class AddProgressToTutorial < ActiveRecord::Migration[5.2]
  def change
    add_column :tutorials, :progress, :float
  end
end
