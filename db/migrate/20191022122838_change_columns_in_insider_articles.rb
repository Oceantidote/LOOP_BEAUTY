class ChangeColumnsInInsiderArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :insider_articles, :card_text_color, :string
  end
end
