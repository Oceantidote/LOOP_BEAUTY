class CreateShowroomProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :showroom_products do |t|
      t.references :showroom, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
