class Admin::LookbooksController < ApplicationController
  before_action :set_lookbook, only: [:destroy, :approve, :reject]

  def index
    @lookbooks = policy_scope([:admin, Lookbook])
  end

  def approve
    @lookbook.approve!
    redirect_to admin_lookbooks_path
  end

  def reject
    @lookbook.update!(lookbook_params) if params[:lookbook].present?
    @lookbook.reject!
    redirect_to admin_lookbooks_path
  end

  def destroy
    @lookbook.destroy
    redirect_to admin_lookbooks_path
  end

  private

  def lookbook_params
    params.require(:lookbook).permit(:rejection_message)
  end

  def set_lookbook
    @lookbook = Lookbook.friendly.find(params[:id])
    authorize [:admin, @lookbook]
  end
end
