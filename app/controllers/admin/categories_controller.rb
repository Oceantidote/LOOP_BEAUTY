class Admin::CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
    authorize @category
    @category.save
    redirect_to admin_categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
