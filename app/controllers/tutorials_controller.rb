class TutorialsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :all_videos]
  before_action :set_tutorial, only: [:edit, :update, :destroy, :show]
  include ActiveStorageValidations
  def index
    @user = User.friendly.find(params[:user_id])
    @tutorials = policy_scope(Tutorial).where(user: @user).where(status: 'approved')
    @sort_method = params[:sort].present? ? params[:sort] : 'created_at,desc'
    @tutorials = @tutorials.filter_sort(*@sort_method.split(','))
    if params[:link] == 'tutorial'
      @tutorials = @tutorials.where(category: 'tutorial')
    elsif params[:link] == 'ask the expert'
      @tutorials = @tutorials.where(category: 'ask the expert')
    end
  end

  def all_videos
    if params[:link] == 'all'
      @videos = Tutorial.where(status: 'approved')
      @title = 'All Videos'
    elsif params[:link] == 'tutorial'
      @videos = Tutorial.where(category: 'tutorial').where(status: 'approved')
      @title = 'Tutorials'
    elsif params[:link] = 'ask the expert'
      @videos = Tutorial.where(category: 'ask the expert').where(status: 'approved')
      @title = 'Ask the Expert'
    else
      @videos = Tutorial.where(status: 'approved')
      @title = 'All Videos'
    end
    if params[:sort].present?
      @videos = @videos.filter_sort(*params[:sort].split(','))
    else
      @videos = @videos.order(created_at: :desc)
    end
    authorize @videos
  end

  def show
    @tutorial.status != "approved" ? @tutorials = Tutorial.all : @tutorials = policy_scope(Tutorial).where(status: 'approved')
    current_tutorial = @tutorials.index(@tutorial)
    @previous_tutorial = @tutorials[@tutorial == @tutorials.first ? @tutorials.index(@tutorials.last) : current_tutorial - 1]
    @next_tutorial = @tutorials[@tutorial == @tutorials.last ? @tutorials.index(@tutorials.first) : current_tutorial + 1]
    @users_tutorials = Tutorial.where(user: @tutorial.user).where(status: 'approved').where.not(id: @tutorial.id)
  end

  def new
    @user = current_user
    @users = User.where(influencer: true)
    @tutorial = Tutorial.new
    authorize @tutorial
  end

  def create
    @user = current_user
    @users = User.where(influencer: true)
    @tutorial = Tutorial.new(tutorial_params)
    if current_user.influencer?
      @tutorial.user = current_user
    end
    authorize @tutorial
    process_video if params.dig(:tutorial, :video)
    if @tutorial.save
      flash[:notice] = 'Tutorial pending approval'
      if current_user.admin
        redirect_to admin_tutorials_path
      else
        UserMailer.with(content: @tutorial, influencer: @user).new_content.deliver_now
        redirect_to user_uploads_path(current_user)
      end
    else
      flash[:error] = 'Please review problems'
      render :new
    end
  end

  def edit
    @user = @tutorial.user
  end

  def update
    if @tutorial.status == 'rejected'
      @tutorial.submit_for_approval!
    end
    process_video if params.dig(:tutorial, :video)
    if @tutorial.update(tutorial_params)
      flash[:notice] = 'Tutorial updated'
      if current_user == @tutorial.user
        redirect_to user_uploads_path(current_user)
      else
        redirect_to tutorial_path(@tutorial)
      end
    else
      flash[:error] = 'Please review problems'
      render :edit
    end
  end

  def destroy
    if @tutorial.destroy
      flash[:notice] = 'tutorial deleted'
      redirect_to admin_tutorials_path
    end
  end

  private

  def process_video
    @tutorial.processing = true
    @tutorial.video.purge if @tutorial.video.attached? && @tutorial.id
  end

  def set_tutorial
    @tutorial = Tutorial.friendly.find(params[:id])
    authorize @tutorial
  end

  def tutorial_params
    params.require(:tutorial).permit(:cover_photo, :title, :status, :video, :user_id, :category, product_ids: [])
  end
end
