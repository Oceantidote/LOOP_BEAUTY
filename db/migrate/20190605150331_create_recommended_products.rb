class CreateRecommendedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :recommended_products do |t|
      t.references :recommender
      t.references :recommended
      t.timestamps
    end
    add_foreign_key :recommended_products, :products, column: :recommender_id, primary_key: :id
    add_foreign_key :recommended_products, :products, column: :recommended_id, primary_key: :id
  end
end
