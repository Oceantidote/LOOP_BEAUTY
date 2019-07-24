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

  def total_price
    Money.new total_price_cents
  end

  def total_price_cents
    credit_spent = money_off_from_credit_cents
    credit_spent > 0 ? subtotal_cents - credit_spent : subtotal_cents
  end

  def money_off
    Money.new money_off_cents
  end

  def money_off_cents
    total_price_cents * (discount_code.discount / 100.to_f)
  end

  def discounted_price
    Money.new discounted_price_cents
  end

  def discounted_price_cents
    total_price_cents - money_off_cents
  end

  def money_off_from_credit
    Money.new money_off_from_credit_cents
  end

  def money_off_from_credit_cents
    return 0 unless user&.influencer?
    total = basket_products.where(purchase_with_credit: true).map(&:price_cents).sum
    return user.remaining_credit_cents > total ? total : user.remaining_credit_cents
  end
end
