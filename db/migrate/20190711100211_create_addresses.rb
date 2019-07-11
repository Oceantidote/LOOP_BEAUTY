class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :postcode
      t.string :street
      t.string :city
      t.boolean :delivery_address

      t.timestamps
    end
  end
end
