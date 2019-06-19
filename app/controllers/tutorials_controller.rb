class TutorialsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_tutorial, only: [:edit, :update, :destroy, :show]

  def index
    @user = User.find(User.select { |user| user.slug == params[:user_id] }.first.id)
    @tutorials = policy_scope(Tutorial).where(user: @user)
  end

  def show
  end

  def new
    @tutorial = Tutorial.new
    authorize @tutorial
  end

  def create
    @tutorial = Tutorial.new(tutorial_params)
    @tutorial.user = current_user
    authorize @tutorial
    if @tutorial.save
      flash[:notice] = 'Tutorial pending approval'
      redirect_to root_path
    else
      flash[:error] = 'Please review problems'
      render :new
    end
  end

  def edit
  end

  def update
    if @tutorial.update(tutorial_params)
      flash[:notice] = 'Tutorial updated'
      redirect_to root_path
    else
      flash[:error] = 'Please review problems'
      render :edit
    end
  end

  def destroy
    if @tutorial.destroy
      flash[:notice] = 'tutorial deleted'
      redirect_to root_path
    end
  end

  private

  def set_tutorial
    @tutorial = Tutorial.friendly.find(params[:id])
    authorize @tutorial
  end

  def tutorial_params
    params.require(:tutorial).permit(:cover_photo, :title, :status, :video, product_ids: [])
  end
end
