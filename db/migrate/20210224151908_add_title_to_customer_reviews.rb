class AddTitleToCustomerReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :customer_reviews, :title, :string
  end
end
