class Admin::TutorialsController < ApplicationController
  before_action :set_tutorial, only: [:approve, :reject, :featured]

  def index
    @tutorials = policy_scope([:admin, Tutorial])
  end

  def approve
    @tutorial.approve!
    redirect_to admin_tutorials_path
  end

  def reject
    @tutorial.update(tutorial_params) if params[:lookbook].present?
    @tutorial.reject!
    redirect_to admin_tutorials_path
  end

  def featured
    @tutorial.update(featured: true)
    redirect_to videos_path
  end

  private

  def tutorial_params
    params.require(:tutorial).permit(:rejection_message)
  end

  def set_tutorial
    @tutorial = Tutorial.find(Tutorial.select { |tutorial| tutorial.slug == params[:id] }.first.id)
    authorize [:admin, @tutorial]
  end
end
