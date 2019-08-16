class AddDeliveryToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :delivery_type, :string
    add_column :orders, :delivery_cost_cents, :integer
  end
end
