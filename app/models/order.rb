class Order < ApplicationRecord
  belongs_to :user
  belongs_to :discount_code, optional: true
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  has_many :shades, through: :order_products
  belongs_to :delivery_address
  belongs_to :billing_address
  validate :discount_uses
  monetize :credit_spent_cents
  monetize :delivery_cost_cents

  def subtotal
    Money.new total_price_cents
  end

  def subtotal_cents
    order_products.map(&:price_cents).sum
  end

  def total_price
    Money.new total_price_cents
  end

  def total_price_cents
    subtotal_cents - credit_spent_cents
  end

  def total_with_delivery
    Money.new total_with_delivery_cents
  end

  def total_with_delivery_cents
    total_price_cents + delivery_cost_cents
  end

  def discount_uses
    return unless discount_code.present?
    if discount_code.orders.size >= discount_code.uses || user.orders.where(discount_code: discount_code).size >= discount_code.user_uses
      errors.add :discount_code, 'number of uses exceeded'
    end
  end

  def set_delivery_costs_cents
    case delivery_type
    when 'standard'
      self[:delivery_cost_cents] = 595
    when 'express'
      self[:delivery_cost_cents] = 695
    when 'international'
      self[:delivery_cost_cents] = 1295
    else
      self[:delivery_cost_cents] = 595
    end
  end
end
