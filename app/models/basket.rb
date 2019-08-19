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

  def total_number_of_products
    basket_products.map(&:quantity).sum
  end

  def subtotal
    Money.new subtotal_cents
  end

  def subtotal_cents
    basket_products.map(&:price_cents).sum
  end

  def subtotal_in(currency)
    info = ExchangeRate.find_by_currency(currency)
    return subtotal unless info
    Money.new(subtotal_cents_in(currency), info.currency_code)
  end

  def subtotal_cents_in(currency)
    basket_products.map { |item| item.price_in_cents(currency) }.sum
  end

  def total_price
    Money.new total_price_cents
  end

  def total_price_cents
    credit_spent = money_off_from_credit_cents
    credit_spent > 0 ? subtotal_cents - credit_spent : subtotal_cents
  end

  def total_price_in(currency)
    info = ExchangeRate.find_by_currency(currency)
    return total_price unless info
    Money.new total_price_cents_in(currency), info.currency_code
  end

  def total_price_cents_in(currency)
    credit_spent = money_off_from_credit_cents_in(currency)
    credit_spent > 0 ? subtotal_cents_in(currency) - credit_spent : subtotal_cents_in(currency)
  end

  def money_off
    Money.new money_off_cents
  end

  def money_off_cents
    total_price_cents * (discount_code.discount / 100.to_f)
  end

  def money_off_in(currency)
    info = ExchangeRate.find_by_currency(currency)
    return money_off unless info
    Money.new money_off_cents_in(currency), info.currency_code
  end

  def money_off_cents_in(currency)
    total_price_cents_in(currency) * (discount_code.discount / 100.to_f)
  end

  def discounted_price
    Money.new discounted_price_cents
  end

  def discounted_price_cents
    total_price_cents - money_off_cents
  end

  def discounted_price_in(currency)
    info = ExchangeRate.find_by_currency(currency)
    return discounted_price unless info
    Money.new discounted_price_cents_in(currency), info.currency_code
  end

  def discounted_price_cents_in(currency)
    total_price_cents_in(currency) - money_off_cents_in(currency)
  end

  def money_off_from_credit
    Money.new money_off_from_credit_cents
  end

  def money_off_from_credit_cents
    return 0 unless user&.influencer?
    total = basket_products.where(purchase_with_credit: true).map(&:price_cents).sum
    return user.remaining_credit_cents > total ? total : user.remaining_credit_cents
  end

  def money_off_from_credit_in(currency)
    info = ExchangeRate.find_by_currency(currency)
    return money_off_from_credit unless info
    Money.new money_off_from_credit_cents_in(currency), info.currency_code
  end

  def money_off_from_credit_cents_in(currency)
    info = ExchangeRate.find_by_currency(currency)
    return money_off_from_credit_cents unless info
    (money_off_from_credit_cents * info.rate).round
  end
end
