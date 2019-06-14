class Admin::BrandsController < ApplicationController
  before_action :set_brand, only: [:edit, :update, :destroy]

  def new
    @brand = Brand.new
    authorize [:admin, @brand]
  end

  def create
    @brand = Brand.create(brand_params)
    if @brand.save
      redirect_to brand_path(@brand)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @brand.update(brand_params)
      redirect_to brand_path(@brand)
    else
      render :edit
    end
  end

  def destroy
    @brand.destroy
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
    authorize [:admin, @brand]
  end

  def brand_params
    params.require(:brand).permit(:name, :description, :logo, :photo, :slug)
  end

end
