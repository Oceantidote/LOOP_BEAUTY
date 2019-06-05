class CreateShades < ActiveRecord::Migration[5.2]
  def change
    create_table :shades do |t|
      t.references :product, foreign_key: true
      t.string :sku

      t.timestamps
    end
  end
end
