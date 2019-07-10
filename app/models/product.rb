class Product < ApplicationRecord
  include Filterable
  scope :category, -> (category) { where category: Category.product_filter(category.reject(&:blank?)) }
  scope :brand, -> (brand) { where brand: Brand.product_filter(brand.reject(&:blank?)) }
  scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
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
  has_many :showroom_products
  has_many :product_benefits, dependent: :destroy
  has_many :tutorial_products, dependent: :destroy
  has_many :lookbook_products, dependent: :destroy
  has_many :wishlist_product, dependent: :destroy
  has_many :benefits, through: :product_benefits
  has_many :sent_recommended_products, class_name: "RecommendedProduct", foreign_key: 'recommender_id', dependent: :destroy
  has_many :received_recommended_products, class_name: "RecommendedProduct", foreign_key: 'recommended_id', dependent: :destroy

  def average_rating
    if customer_reviews.count == 0
       0
    else
      sum = 0
      customer_reviews.each do |r|
        sum += r.rating
      end
      return sum / customer_reviews.count
    end
  end

  def total_reviews
    customer_reviews.count
  end

  def self.filter_sort(attr, direction)
    order(attr => direction.to_sym)
  end
end
