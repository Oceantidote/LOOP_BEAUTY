class Basket < ApplicationRecord
  belongs_to :user
  has_many :basket_products
  has_many :products, through: :basket_products
end
