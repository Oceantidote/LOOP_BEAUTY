class AddCountryAndCountyToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :country, :string
    add_column :addresses, :county, :string
  end
end
