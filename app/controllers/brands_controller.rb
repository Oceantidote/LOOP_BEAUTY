class BrandsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @brands = policy_scope(Brand).order(name: :ASC)
    @brands_index = ('A'..'Z').to_a
  end

  def show
    @brand = Brand.friendly.find(params[:id])
    authorize @brand
    @products = @brand.products.where(published:true)
    @all = @products
    @original = @brand.products.where(published:true)
    @products = @products.filter(params[:product].slice(:sub_category)).page params[:page] if params[:product].present?
    if params[:product].present? && params[:product][:sort].present?
      @products = @products.filter_sort(*sort_params)
      @sort_method = params[:product][:sort][:method]
    else
      @products = @products.filter_sort(*'created_at,desc'.split(',')).page params[:page]
      @sort_method = 'created_at,desc'
    end
    respond_to do |format|
      format.html { render 'brands/show' }
      format.js
    end
  end

  private

  def sort_params
    params[:product][:sort][:method].split(',')
  end
end
