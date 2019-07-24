class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :shade
  belongs_to :user

  def price_cents
    product.price_cents * quantity
  end
end
