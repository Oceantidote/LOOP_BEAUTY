class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :shade
  belongs_to :user
end
