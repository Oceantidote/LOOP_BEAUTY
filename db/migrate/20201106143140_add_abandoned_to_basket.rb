class AddAbandonedToBasket < ActiveRecord::Migration[5.2]
  def change
    add_column :baskets, :abandoned, :boolean, default: false
  end
end
