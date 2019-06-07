class Product < ApplicationRecord
  include Filterable
  scope :category, -> (category) { where category: category }
  scope :brand, -> (brand) { where brand: brand }
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :category
  belongs_to :sub_category
  belongs_to :brand
  belongs_to :department
  has_many :shades, dependent: :destroy
  has_many :tutorials, through: :tutorial_products
  has_many :lookbooks, through: :lookbook_products
  has_many :insider_reviews
  has_many :customer_reviews
  monetize :price_cents
  has_many :product_benefits, dependent: :destroy
  has_many :benefits, through: :product_benefits
  has_many :sent_recommended_products, class_name: "RecommendedProduct", foreign_key: 'recommender_id', dependent: :destroy
  has_many :received_recommended_products, class_name: "RecommendedProduct", foreign_key: 'recommended_id', dependent: :destroy

end
