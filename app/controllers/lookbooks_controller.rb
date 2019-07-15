class LookbooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_lookbook, only: [:edit, :update, :destroy]

  def index
    @user = User.friendly.find(params[:user_id])
    @lookbooks = policy_scope(Lookbook).where(user: @user)
    @sort_method = params[:sort].present? ? params[:sort][:sort_method] : 'created_at,desc'
    @lookbooks = @lookbooks.filter_sort(*@sort_method.split(','))
  end

  def show

    # NOT SURE IF CORRECT BUT WORKS
    user = User.find(params[:user_id])
    @lookbook = Lookbook.find((Lookbook.select{ |r| r.slug == params[:id]}).first.id)
    @lookbooks = Lookbook.where(user: user)
    @all_lookbooks = Lookbook.all
    authorize @lookbook
    current_lookbook = @lookbooks.index(@lookbook)
    @previous_lookbook = @lookbooks[@lookbook == @lookbooks.first ? @lookbooks.index(@lookbooks.last) : current_lookbook - 1]
    @next_lookbook = @lookbooks[@lookbook == @lookbooks.last ? @lookbooks.index(@lookbooks.first) : current_lookbook + 1]
  end

  def new
    @lookbook = Lookbook.new
    @user = current_user
    authorize @lookbook
  end

  def create
    @lookbook = Lookbook.new(lookbook_params)
    @lookbook.user = current_user
    authorize @lookbook
    if @lookbook.save
      flash[:notice] = 'Lookbook pending approval'
      redirect_to root_path
    else
      raise
      flash[:error] = 'Please review problems'
      render :new
    end
  end

  def edit
  end

  def update
    if @lookbook.update(lookbook_params)
      flash[:notice] = 'Lookbook updated'
      redirect_to root_path
    else
      flash[:error] = 'Please review problems'
      render :edit
    end
  end

  def destroy
    if @lookbook.destroy
      flash[:notice] = 'Lookbook deleted'
      redirect_to root_path
    end
  end

  def approve
    @lookbook.approve!
    redirect_to admin_lookbooks_path
  end

  def reject
    @lookbook.update(lookbook_params)
    @lookbook.reject!
    redirect_to admin_lookbooks_path
  end

  private

  def set_lookbook
    # @lookbook = Lookbook.friendly.find(params[:id])

    # NOT SURE IF CORRECT BUT WORKS
    user = User.select { |u| u.slug == params[:id] }.first
    @lookbook = Lookbook.find(user.id)
    authorize @lookbook
  end

  def lookbook_params
    params.require(:lookbook).permit(:title, :photo, :rejection_message, product_ids: [])
  end
end
