class Basket < ApplicationRecord
  belongs_to :user, optional: true
  has_many :basket_products
  has_many :products, through: :basket_products
  has_many :shades, through: :products

  def empty?
    basket_products.empty?
  end

  def empty!
    basket_products.destroy_all
  end

  def total_price
    basket_products.map { |item| item.product.price * item.quantity  }.sum
  end

  def total_price_cents
    basket_products.map { |item| item.product.price_cents * item.quantity  }.sum
  end
end
