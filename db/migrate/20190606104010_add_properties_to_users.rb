class AddPropertiesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :country, :string
    add_column :users, :origin, :string
    add_column :users, :instagram, :string
    add_column :users, :twitter, :string
    add_column :users, :youtube, :string
    add_column :users, :newsletter, :boolean, default: false
    add_column :users, :accepts_terms, :boolean, default: false
    add_column :users, :influencer, :boolean, default: false
  end
end
