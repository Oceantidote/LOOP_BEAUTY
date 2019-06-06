class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.float :weight
      t.string :measurement
      t.string :title
      t.text :details
      t.string :lb_id
      t.references :category, foreign_key: true
      t.references :sub_category, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
