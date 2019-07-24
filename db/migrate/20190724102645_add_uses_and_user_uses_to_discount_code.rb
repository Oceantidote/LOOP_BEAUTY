class AddUsesAndUserUsesToDiscountCode < ActiveRecord::Migration[5.2]
  def change
    add_column :discount_codes, :uses, :integer, default: 1
    add_column :discount_codes, :user_uses, :integer, default: 1
  end
end
