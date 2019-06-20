class BasketProduct < ApplicationRecord
  belongs_to :basket
  belongs_to :product
  belongs_to :shade

  def convert_to_order_product
    OrderProduct.new(
      product: product,
      shade: shade,
      quantity: quantity
    )
  end
end
