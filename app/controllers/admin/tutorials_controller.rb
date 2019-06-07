class Admin::TutorialsController < ApplicationController
  def index
    @tutorials = policy_scope([:admin, Tutorial])
  end

  def approve
    @tutorial.approve!
    redirect_to admin_tutorials_path
  end

  def reject
    @tutorial.reject!
    redirect_to admin_tutorials_path
  end

  private

  def set_tutorial
    @tutorial = Tutorial.find(params[:id])
    authorize [:admin, @tutorial]
  end
end
