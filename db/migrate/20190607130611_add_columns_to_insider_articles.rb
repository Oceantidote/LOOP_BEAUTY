class AddColumnsToInsiderArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :insider_articles, :by, :string
    add_column :insider_articles, :category, :string
    add_column :insider_articles, :title, :string
    add_column :insider_articles, :text1, :text
    add_column :insider_articles, :text2, :text
    add_column :insider_articles, :text3, :text
    add_column :insider_articles, :text4, :text
    add_column :insider_articles, :cover_alt_text, :string
    add_column :insider_articles, :photo1_alt_text, :string
    add_column :insider_articles, :photo2_alt_text, :string
    add_column :insider_articles, :photo3_alt_text, :string
  end
end
