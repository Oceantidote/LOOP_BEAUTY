class WishlistProductsController < ApplicationController
  before_action :set_product, only: [:create]
  before_action :set_products, only: [:create, :destroy]
  before_action :set_wishlist_product, only: [:destroy, :add_to_bag]
  before_action :set_wishlist_products, only: [:create]

  def create
    @wishlist_product = WishlistProduct.new(wishlist: current_user.wishlist, product: @product)
    @wishlist = @wishlist_product.wishlist
    @wishlist_product.shade = Shade.find_by_id(params[:shade]) || @wishlist_product.product.shades.first
    authorize @wishlist_product
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
    @product = @wishlist_product.product
    authorize @wishlist_product
    @wishlist_product.destroy
    respond_to do |format|
      format.html { render 'users/wishlist' }
      format.js
    end
  end

  def add_to_bag
    authorize @wishlist_product
    @item = @wishlist_product.convert_to_basket_product
    @basket = find_basket
    @item.basket = @basket
    @item.save
    @wishlist_product.destroy
    respond_to do |format|
      format.html { redirect_to bag_path }
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
