class Admin::LookbooksController < ApplicationController
  def index
    @lookbooks = policy_scope([:admin, Lookbook])
  end

  def approve
    @lookbook.approve!
    redirect_to admin_lookbooks_path
  end

  def reject
    @lookbook.reject!
    redirect_to admin_lookbooks_path
  end

  private

  def set_lookbook
    @lookbook = Lookbook.find(params[:id])
    authorize [:admin, @lookbook]
  end
end
