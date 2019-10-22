class RemoveForeignKeyFromInsiderArticles < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :insider_articles, column: :user_id
  end
end
