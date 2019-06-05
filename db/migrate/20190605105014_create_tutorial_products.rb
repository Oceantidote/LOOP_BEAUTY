class CreateTutorialProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :tutorial_products do |t|
      t.references :tutorial, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
