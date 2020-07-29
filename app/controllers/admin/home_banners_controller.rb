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

    if @home_banner.save!
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
      redirect_to admin_home_banners_path
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

  def home_banner_params
    params.require(:home_banner).permit(:pixel2xl, :ipad, :ipadpro, :ipadx, :iphone, :iphonese, :pixel, :galaxy, :pixel2, :pixel3, :galaxy2, :galaxymini, :flexi, :iphone9, :iphone10, :tablet, :tabletlrg, :tabletpan, :content, :link, :link_text, :display, :banner, :text_color, :mobile_banner)
  end
end
