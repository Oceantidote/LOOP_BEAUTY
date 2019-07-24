class Showroom < ApplicationRecord
  belongs_to :user
  has_many :showroom_products
  has_many :products, through: :showroom_products
end
