class Order < ApplicationRecord
  paginates_per 12
  belongs_to :user
  belongs_to :discount_code, optional: true
  belongs_to :affiliation, polymorphic: true, optional: true
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  has_many :shades, through: :order_products
  belongs_to :delivery_address, class_name: 'Address'
  belongs_to :billing_address, class_name: 'Address'
  validates_presence_of :delivery_address, class_name: 'Address'
  validates_presence_of :billing_address, class_name: 'Address'
  validate :discount_uses
  monetize :credit_spent_cents
  monetize :delivery_cost_cents
  after_create :set_sku
  after_save :check_for_referral

  def set_sku
    self.update(sku: "ORDERSKU-00#{self.id}")
  end

  def unadjusted_price
    Money.new unadjusted_price_cents
  end

  def unadjusted_price_cents
    order_products.map(&:unadjusted_price_cents).sum
  end

  def money_off
    Money.new money_off_cents
  end

  def money_off_cents
    unadjusted_price_cents - total_price_cents
  end

  def total_number_of_products
    order_products.map(&:quantity).sum
  end

  def subtotal
    Money.new total_price_cents
  end

  def subtotal_cents
    order_products.map(&:price_cents).sum
  end

  def initial_subtotal
    order_products.map(&:price).sum
  end

  def subtotal_in(currency)
    info = ExchangeRate.find_by_currency(currency)
    return subtotal unless info
    Money.new total_price_cents_in(currency), info.currency_code
  end

  def subtotal_cents_in(currency)
    order_products.map { |item| item.price_cents_in(currency) }.sum
  end

  def total_price
    Money.new total_price_cents
  end

  def total_price_cents
    subtotal_cents - credit_spent_cents
  end

  def total_price_in(currency)
    info = ExchangeRate.find_by_currency(currency)
    Money.new total_price_cents_in(currency), info.currency_code
  end

  def total_price_cents_in(currency)
    subtotal_cents_in(currency) - credit_spent_cents_in(currency)
  end

  def credit_spent_cents_in(currency)
    info = ExchangeRate.find_by_currency(currency)
    return credit_spent_cents unless info
    (credit_spent_cents * info.rate).round
  end

  def total_with_delivery
    Money.new total_with_delivery_cents
  end

  def total_with_delivery_cents
    total_price_cents + delivery_cost_cents
  end

  def total_with_delivery_in(currency)
    info = ExchangeRate.find_by_currency(currency)
    return total_with_delivery unless info
    Money.new total_with_delivery_cents_in(currency), info.currency_code
  end

  def total_with_delivery_cents_in(currency)
    total_price_cents_in(currency) + delivery_cost_cents_in(currency)
  end

  def delivery_cost_cents_in(currency)
    info = ExchangeRate.find_by_currency(currency)
    (delivery_cost_cents * info.rate).round
  end

  def discount_uses
    return unless discount_code.present?
    if discount_code.orders.size > discount_code.uses || user.orders.where(discount_code: discount_code).size > discount_code.user_uses
      errors.add :discount_code, 'number of uses exceeded'
    end
    if user.referral_code == discount_code.code
      errors.add :discount_code, 'cannot be your own referral code'
    end
  end

  def delivery_to_num
    case delivery_type
    when 'standard'
      return 2
    when 'express'
      return 1
    when 'international'
      return 0
    else
      return 2
    end
  end

  def delivery_cost
    case delivery_type
    when 'standard'
      5.95
    when 'express'
      6.95
    when 'international'
      12.95
    else
      5.95
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

  def processed?
    processed
  end

  def check_for_referral
    return unless discount_code.present? && processed?
    user = User.find_by_referral_code(discount_code.code)
    return unless user.present?
    new_discount = DiscountCode.create(discount: 15)
    UserMailer.with(user: user, discount: new_discount).referral.deliver_now
  end
end
