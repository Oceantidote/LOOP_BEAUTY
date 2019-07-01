class Showroom < ApplicationRecord
  belongs_to :user
  has_many :showroom_products
end
