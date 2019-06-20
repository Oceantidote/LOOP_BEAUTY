class AddRejectionMessageToLookbooks < ActiveRecord::Migration[5.2]
  def change
    add_column :lookbooks, :rejection_message, :text
  end
end
