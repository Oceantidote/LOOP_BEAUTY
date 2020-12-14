class AddAbandonableToBasket < ActiveRecord::Migration[5.2]
  def change
    add_column :baskets, :abandonable, :boolean, default: false
  end
end
