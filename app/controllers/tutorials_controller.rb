class TutorialsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :all_videos]
  before_action :set_tutorial, only: [:edit, :update, :destroy, :show]

  def index
    @user = User.friendly.find(params[:user_id])
    @tutorials = policy_scope(Tutorial).where(user: @user).where(status: 'approved')
    @sort_method = params[:sort].present? ? params[:sort][:sort_method] : 'created_at,desc'
    @tutorials = @tutorials.filter_sort(*@sort_method.split(','))
  end

  def all_videos
    if params[:link] == 'all'
      @videos = Tutorial.where(status: 'approved')
      @title = 'All Videos'
    elsif params[:link] == 'tutorial'
      @videos = Tutorial.where(category: 'tutorial').where(status: 'approved')
      @title = 'Tutorials'
    elsif params[:link] = 'Ask the expert'
      @videos = Tutorial.where(category: 'ask the expert').where(status: 'approved')
      @title = 'Ask the experts'
    end
    authorize @videos
  end

  def show
    @tutorials = policy_scope(Tutorial).where(status: 'approved')
    current_tutorial = @tutorials.index(@tutorial)
    @previous_tutorial = @tutorials[@tutorial == @tutorials.first ? @tutorials.index(@tutorials.last) : current_tutorial - 1]
    @next_tutorial = @tutorials[@tutorial == @tutorials.last ? @tutorials.index(@tutorials.first) : current_tutorial + 1]
  end

  def new
    @user = current_user
    @tutorial = Tutorial.new
    authorize @tutorial
  end

  def create
    @tutorial = Tutorial.new(tutorial_params)
    @tutorial.user = current_user
    authorize @tutorial
    if @tutorial.save
      flash[:notice] = 'Tutorial pending approval'
      redirect_to user_uploads_path(current_user)
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
