class BasketProduct < ApplicationRecord
  belongs_to :basket
  belongs_to :product
  belongs_to :shade

  def convert_to_order_product
    OrderProduct.new(
      product: product,
      shade: shade,
      quantity: quantity,
      purchase_with_credit: purchase_with_credit
    )
  end

  def purchase_with_credit?
    purchase_with_credit
  end

  def individual_price
    Money.new individual_price_cents
  end

  def us_individual_price
    Money.new us_individual_price_cents, :usd
  end

  def individual_price_cents
    if basket.discount_code.present?
      (product.price_cents * ((100 - basket.discount_code.discount) / 100.to_f)).ceil
    else
      product.price_cents
    end
  end

  def us_individual_price_cents
    if basket.discount_code.present?
      (product.us_price_cents * ((100 - basket.discount_code.discount) / 100.to_f)).ceil
    else
      product.us_price_cents
    end
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

  def price_cents
    if basket.discount_code.present?
      (unadjusted_price_cents * ((100 - basket.discount_code.discount) / 100.to_f)).ceil
    else
      unadjusted_price_cents
    end
  end

  def us_price_cents
    if basket.discount_code.present?
      (us_unadjusted_price_cents * ((100 - basket.discount_code.discount) / 100.to_f)).ceil
    else
      us_unadjusted_price_cents
    end
  end

  def unadjusted_price_in_cents(currency)
    info = ExchangeRate.find_by_currency(currency)
    return unadjusted_price_cents unless info
    (unadjusted_price_cents * info.rate).round
  end

  def unadjusted_price_cents
    product.price_cents * quantity
  end

  def us_unadjusted_price_cents
    product.us_price_cents * quantity
  end
end
