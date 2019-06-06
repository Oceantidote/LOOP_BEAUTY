class ProductBenefit < ApplicationRecord
  belongs_to :product
  belongs_to :benefit
end
