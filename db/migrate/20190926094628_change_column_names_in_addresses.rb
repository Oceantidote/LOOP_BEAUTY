class ChangeColumnNamesInAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :street, :address_line1
    rename_column :addresses, :street2, :address_line2
  end
end
