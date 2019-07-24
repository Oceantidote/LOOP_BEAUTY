class CreateFreebies < ActiveRecord::Migration[5.2]
  def change
    create_table :freebies do |t|
      t.references :discount_code, foreign_key: true

      t.timestamps
    end
  end
end
