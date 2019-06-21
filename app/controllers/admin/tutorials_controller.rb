class Admin::TutorialsController < ApplicationController
  before_action :set_tutorial, only: [:approve, :reject]

  def index
    @tutorials = policy_scope([:admin, Tutorial])
  end

  def approve
    @tutorial.approve!
    redirect_to admin_tutorials_path
  end

  def reject
    @tutorial.update(tutorial_params)
    @tutorial.reject!
    redirect_to admin_tutorials_path
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
