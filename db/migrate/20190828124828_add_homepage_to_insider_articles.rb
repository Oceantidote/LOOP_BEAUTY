class AddHomepageToInsiderArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :insider_articles, :homepage, :boolean, default: false
  end
end
