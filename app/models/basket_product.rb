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

  def price_cents
    product.price_cents * quantity
  end
end
