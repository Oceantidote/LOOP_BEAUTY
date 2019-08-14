class AddRecommendationToCustomerReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :customer_reviews, :recommendation, :string
  end
end
