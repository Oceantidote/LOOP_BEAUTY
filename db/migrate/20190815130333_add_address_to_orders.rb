class AddAddressToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :delivery_address, foreign_key: { to_table: :addresses }
    add_reference :orders, :billing_address, foreign_key: { to_table: :addresses }
  end
end
