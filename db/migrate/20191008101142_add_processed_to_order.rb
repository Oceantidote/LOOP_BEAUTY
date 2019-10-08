class AddProcessedToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :processed, :boolean, default: false
  end
end
