class Order < ApplicationRecord
  belongs_to :user
  belongs_to :discount_code, optional: true
  has_many :order_products
  has_many :products, through: :order_products
  has_many :shades, through: :order_products

  def total_price
    order_products.map { |item| item.product.price * item.quantity  }.sum
  end

  def total_price_cents
    order_products.map { |item| item.product.price_cents * item.quantity  }.sum
  end
end
