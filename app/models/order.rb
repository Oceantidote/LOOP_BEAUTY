class Order < ApplicationRecord
  belongs_to :user
  belongs_to :discount_code
  has_many :order_products
  has_many :products, through: :order_products
  has_many :shades, through: :order_products
end
