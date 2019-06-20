class AddRejectionMessageToTutorials < ActiveRecord::Migration[5.2]
  def change
    add_column :tutorials, :rejection_message, :text
  end
end
