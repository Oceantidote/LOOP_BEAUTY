class DiscountCode < ApplicationRecord
  has_many :orders
  has_many :baskets
  has_one :freebie, dependent: :destroy
end
