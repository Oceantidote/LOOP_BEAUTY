class Admin::HomeBannersController < ApplicationController
  before_action :set_home_banner, only: [:edit, :update, :destroy]
  def index
    @home_banners = policy_scope([:admin, HomeBanner])
  end

  def new
    @home_banner = HomeBanner.new
    authorize [:admin, @home_banner]
  end

  def create
    @home_banner = HomeBanner.new(home_banner_params)

    if @home_banner.save
      redirect_to admin_home_banners_path
    else
      render :new
    end
    authorize [:admin, @home_banner]
  end

  def edit
    authorize [:admin, @home_banner]
  end

  def update
    @home_banner = HomeBanner.find(params[:id])
    if @home_banner.update(home_banner_params)
      authorize [:admin, @home_banner]
      redirect_to edit_admin_home_banner_path(@home_banner)
    else
      render :edit
    end
  end

  def destroy
    @home_banner = HomeBanner.find(params[:id])
    @home_banner.destroy
    redirect_to admin_home_banners_path
  end

  private

  def set_home_banner
    @home_banner = HomeBanner.find(params[:id])
  end

  def permit_hash
    [:content, :link, :link_text, :display,:text_color,:banner,:mobile_banner] + HomeBanner.unique_symbols_array
  end

  def home_banner_params
    params.require(:home_banner).permit(permit_hash)
  end
end
