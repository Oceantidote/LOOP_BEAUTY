class CreateInsiderReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :insider_reviews do |t|
      t.references :user, foreign_key: true
      t.integer :rating
      t.references :product, foreign_key: true
      t.text :review

      t.timestamps
    end
  end
end
