class BasketProduct < ApplicationRecord
  belongs_to :basket
  belongs_to :product
  belongs_to :shade
end
