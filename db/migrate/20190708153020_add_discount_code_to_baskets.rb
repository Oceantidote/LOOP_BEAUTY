class AddDiscountCodeToBaskets < ActiveRecord::Migration[5.2]
  def change
    add_reference :baskets, :discount_code, foreign_key: true
  end
end
