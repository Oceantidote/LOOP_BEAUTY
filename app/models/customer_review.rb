class CustomerReview < ApplicationRecord
  paginates_per 6
  belongs_to :user
  belongs_to :product
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: [0,1,2,3,4,5] }
end
