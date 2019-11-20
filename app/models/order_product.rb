class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :shade


  def price
    Money.new price_cents
  end
  
  def price_cents
    if order.discount_code.present?
      (unadjusted_price_cents * ((100 - order.discount_code.discount) / 100.to_f)).ceil
    else
      unadjusted_price_cents
    end
  end
  
  def individual_price
    Money.new individual_price_cents
  end
  
  def individual_price_cents
    if order.discount_code.present?
      (product.price_cents * ((100 - order.discount_code.discount) / 100.to_f)).ceil
    else
      product.price_cents
    end
  end

  def unadjusted_price_cents
    product.price_cents * quantity
  end
  
  def price_cents_in(currency)
    info = ExchangeRate.find_by_currency(currency)
    return price_cents unless info
    (price_cents * info.rate).round
  end
 
  def unadjusted_price_in_cents(currency)
    info = ExchangeRate.find_by_currency(currency)
    return unadjusted_price_cents unless info
    (unadjusted_price_cents * info.rate).round
  end


  def individual_price_in(currency)
    Money.new individual_price_cents_in(currency)
  end

  def individual_price_cents_in(currency)
    nfo = ExchangeRate.find_by_currency(currency)
    return price_cents unless info
    (individual_price_cents * info.rate).round
  end

  def price_in_cents(currency)
    info = ExchangeRate.find_by_currency(currency)
    return price_cents unless info
    (price_cents * info.rate).round
  end

end
