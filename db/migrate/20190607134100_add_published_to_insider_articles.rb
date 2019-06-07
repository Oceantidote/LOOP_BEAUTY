class AddPublishedToInsiderArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :insider_articles, :published, :boolean, default: false
  end
end
