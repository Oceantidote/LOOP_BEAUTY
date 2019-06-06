class Product < ApplicationRecord
  belongs_to :category
  belongs_to :sub_category
  belongs_to :brand
  belongs_to :department
  has_many :shades
  has_many :tutorials, through: :tutorial_products
  has_many :lookbooks, through: :lookbook_products
  has_many :insider_reviews
  has_many :customer_reviews
  monetize :price_cents
  has_many :benefits, through: :product_benefits
  has_many :sent_recommended_products, class_name: "RecommendedProduct", foreign_key: 'recommender_id'
  has_many :received_recommended_products, class_name: "RecommendedProduct", foreign_key: 'recommended_id'

end
