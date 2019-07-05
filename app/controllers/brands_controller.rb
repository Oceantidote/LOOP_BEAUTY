class BrandsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @brands = policy_scope(Brand)
    @brands_index = ('A'..'Z').to_a
  end

  def show
    @brand = Brand.friendly.find(params[:id])
    authorize @brand
    @products = @brand.products
    respond_to do |format|
      format.html { render 'brands/show' }
      format.js
    end
  end
end
