class AddRecoveredToBasket < ActiveRecord::Migration[5.2]
  def change
    add_column :baskets, :recovered, :boolean, default: false
    add_column :baskets, :recovered_completed, :boolean, default: false
  end
end
