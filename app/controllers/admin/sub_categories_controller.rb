class Admin::SubCategoriesController < ApplicationController
  def create
    @sub_category = SubCategory.new(sub_category_params)
    @sub_category.category = SubCategory.find(params[:sub_category][:category_id].to_i)
    authorize @sub_category
    @sub_category.save!
    redirect_to admin_categories_path
  end

  def destroy
    @sub_category = SubCategory.find(params[:id])
    @sub_category.destroy
    redirect_to admin_categories_path
  end

  private

  def sub_category_params
    params.require(:sub_category).permit(:name, :category)
  end
end
