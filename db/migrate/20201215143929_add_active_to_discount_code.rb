class AddActiveToDiscountCode < ActiveRecord::Migration[5.2]
  def change
    add_column :discount_codes, :active, :boolean, default: true
  end
end
