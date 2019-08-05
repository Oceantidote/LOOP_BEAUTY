class Shade < ApplicationRecord
  belongs_to :product
  has_many :basket_products, dependent: :destroy
  has_many :order_products, dependent: :destroy
  # WISHLIST TEST
  has_many :wishlist_products, dependent: :destroy
  # WISHLIST TEST
  has_many_attached :photos
  after_create :set_sku

  def set_sku
    self.update(sku: "SKU-#{self.id}")
  end
end
