class AddFeaturedToInsiderArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :insider_articles, :featured, :boolean, default: false
  end
end
