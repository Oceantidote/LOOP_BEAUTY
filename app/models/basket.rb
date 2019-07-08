class Basket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :discount_code, optional: true
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
    price = basket_products.map { |item| item.product.price_cents * item.quantity  }.sum
    discount_code.present? ? price * (discount_code.discount / 100.to_f) : price
  end

  def money_off
    price = basket_products.map { |item| item.product.price * item.quantity  }.sum
    price * (discount_code.discount / 100.to_f)
  end

  def money_off_cents
    price = basket_products.map { |item| item.product.price_cents * item.quantity  }.sum
    price * (discount_code.discount / 100.to_f)
  end

  def discounted_price
    price = basket_products.map { |item| item.product.price * item.quantity  }.sum
    price - (price * (discount_code.discount / 100.to_f))
  end

  def discounted_price_cents
    price = basket_products.map { |item| item.product.price_cents * item.quantity  }.sum
    price - (price * (discount_code.discount / 100.to_f))
  end
end
