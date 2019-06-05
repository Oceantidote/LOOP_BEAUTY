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
end
