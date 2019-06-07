class Shade < ApplicationRecord
  belongs_to :product
  has_many :basket_products, dependent: :destroy
  has_many :order_products, dependent: :destroy
  has_many_attached :photos
end
