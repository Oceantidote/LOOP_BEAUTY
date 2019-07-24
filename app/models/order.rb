class Order < ApplicationRecord
  belongs_to :user
  belongs_to :discount_code, optional: true
  has_many :order_products
  has_many :products, through: :order_products
  has_many :shades, through: :order_products
  validate :discount_uses

  def total_price
    order_products.map { |item| item.product.price * item.quantity  }.sum
  end

  def total_price_cents
    order_products.map { |item| item.product.price_cents * item.quantity  }.sum
  end

  def discount_uses
    return unless discount_code.present?
    if discount_code.orders.size >= discount_code.uses || user.orders.where(discount_code: discount_code).size >= discount_code.user_uses
      errors.add :discount_code, 'number of uses exceeded'
    end
  end
end
