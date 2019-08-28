class AddFeaturedToTutorials < ActiveRecord::Migration[5.2]
  def change
    add_column :tutorials, :featured, :boolean, default: false
  end
end
