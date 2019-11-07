class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :shade

  def price_cents
    product.price_cents * quantity
  end

  def price
    product.price * quantity
  end

  def price_cents_in(currency)
    info = ExchangeRate.find_by_currency(currency)
    return price_cents unless info
    (price_cents * info.rate).round
  end
end
