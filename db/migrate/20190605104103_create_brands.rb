class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.string :logo
      t.string :photo

      t.timestamps
    end
  end
end
