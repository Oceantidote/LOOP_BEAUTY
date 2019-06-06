class Benefit < ApplicationRecord
  has_many :products, through: :product_benefits
end
