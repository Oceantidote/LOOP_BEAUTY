class CreateLookbookProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :lookbook_products do |t|
      t.references :lookbook, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
