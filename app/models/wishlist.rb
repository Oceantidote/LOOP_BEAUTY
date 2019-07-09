class Wishlist < ApplicationRecord
  belongs_to :user
  # WISHLIST TEST
  has_many :wishlist_products , dependent: :destroy
  has_many :products, through: :wishlist_products
  # WISHLIST TEST
  has_many :shades
end
