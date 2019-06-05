class CreateDiscountCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :discount_codes do |t|
      t.string :code
      t.integer :discount

      t.timestamps
    end
  end
end
