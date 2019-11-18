class AddArticleDateToInsiderArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :insider_articles, :article_date, :date
  end
end
