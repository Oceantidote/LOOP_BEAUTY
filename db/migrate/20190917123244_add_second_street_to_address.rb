class AddSecondStreetToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :street2, :string
  end
end
