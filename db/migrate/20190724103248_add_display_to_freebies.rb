class AddDisplayToFreebies < ActiveRecord::Migration[5.2]
  def change
    add_column :freebies, :display, :boolean, default: false
    add_column :freebies, :blurb, :string
    add_column :freebies, :heading, :string
  end
end
