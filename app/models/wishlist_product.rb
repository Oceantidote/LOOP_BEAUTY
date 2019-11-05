class WishlistProduct < ApplicationRecord
  paginates_per 12

  belongs_to :product
  belongs_to :shade
  belongs_to :wishlist

  def convert_to_basket_product
    BasketProduct.new(product: product, shade: shade)
  end
end
