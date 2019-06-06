class RecommendedProduct < ApplicationRecord
  belongs_to :recommender, class_name: 'Product'
  belongs_to :recommended, class_name: 'Product'
end
