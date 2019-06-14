class Admin::BrandsController < ApplicationController
  before_action :set_brand, only: [:edit, :update, :destroy]

  def new
    @brand = Brand.new
    authorize @brand
  end

  def create
    @brand = Brand.create(brand_parmas)
    if @brand.save
      redirect_to brand_path(@brand)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @brand.update(brand_parmas)
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
    authorize @brand
  end

  def brand_parmas
    parmas.require(:brand).permit(:name, :description, :logo, :photo, :slug)
  end

end
