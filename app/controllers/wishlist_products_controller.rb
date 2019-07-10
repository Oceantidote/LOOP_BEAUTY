class WishlistProductsController < ApplicationController
  before_action :set_product, only: [:create]
  before_action :set_products, only: [:create, :destroy]
  before_action :set_wishlist_product, only: [:destroy]
  before_action :set_wishlist_products, only: [:create]
  skip_after_action :verify_authorized

  def create
    @wishlist_product = WishlistProduct.new(wishlist: current_user.wishlist, product: @product)
    @wishlist = @wishlist_product.wishlist
    @wishlist_product.shade = @wishlist_product.product.shades.first
    # authorize @wishlist_product
    if @wishlist_product.save
      respond_to do |format|
        format.html { render 'products/index' }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'products/index' }
        format.js
      end
    end
  end

  def destroy
    @wishlist = @wishlist_product.wishlist
    @wishlist_product.destroy
    respond_to do |format|
      format.html { render 'users/wishlist' }
      format.js
    end
  end

  private

  def set_product
    @product = Product.select { |p| p.slug == params[:product_id] }.first
  end

  def set_products
    @products = Product.all
  end

  def set_wishlist_product
    @wishlist_product = WishlistProduct.find(params[:id])
  end

  def set_wishlist_products
    @wishlist_products = WishlistProduct.where(wishlist: current_user)
  end
end
