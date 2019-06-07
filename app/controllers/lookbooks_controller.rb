class LookbooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_lookbook, only: [:show, :edit, :destroy, :update]
  def index
    @lookbooks = policy_scope(Lookbook)
  end

  def show
  end

  def new
    @lookbook = Lookbook.new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def lookbook_params
    params.require(:lookbook).permit(:photo, :title, products: [])
  end

  def set_lookbook
    @lookbook = Lookbook.find(params[:id])
    authorize @lookbook
  end

end
