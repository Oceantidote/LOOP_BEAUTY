class DiscountCode < ApplicationRecord
  has_many :orders
  has_many :baskets
end
