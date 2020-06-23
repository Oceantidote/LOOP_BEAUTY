class AddSlugToInsiderArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :insider_articles, :slug, :string
    add_index :insider_articles, :slug, unique: true
  end
end
