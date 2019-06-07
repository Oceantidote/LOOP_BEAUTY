class LookbooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_lookbook, only: [:edit, :update, :destroy, :show]

  def index
    @lookbooks = policy_scope(Lookbook)
  end

  def show
  end

  def new
    @lookbook = Lookbook.new
  end

  def create
    @lookbook = Lookbook.new(lookbook_params)
    if @lookbook.save
      flash[:notice] = 'Lookbook pending approval'
      redirect_to root_path
    else
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

  private

  def set_lookbook
    @lookbook = Lookbook.find(params[:id])
  end

  def lookbook_params
    params.require(:lookbook).permit(:title, :photo, product_ids: [])
  end
end
