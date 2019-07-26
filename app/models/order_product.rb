class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :shade

  def price_cents
    product.price_cents * quantity
  end
end
