class ChangeApprovedToStatusOnLookbook < ActiveRecord::Migration[5.2]
  def change
    rename_column :lookbooks, :approved, :status
    rename_column :tutorials, :approved, :status
    change_column :lookbooks, :status, :string, default: 'pending'
    change_column :tutorials, :status, :string, default: 'pending'
  end
end
