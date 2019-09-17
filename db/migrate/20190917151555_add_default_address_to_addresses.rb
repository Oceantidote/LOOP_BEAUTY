class AddDefaultAddressToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :default_address, :boolean, default: false
  end
end
