class CreateInsiderArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :insider_articles do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
