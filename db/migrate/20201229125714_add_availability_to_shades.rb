class AddAvailabilityToShades < ActiveRecord::Migration[5.2]
  def change
    add_column :shades, :uk_available, :boolean, default: true
    add_column :shades, :us_available, :boolean, default: false
  end
end
