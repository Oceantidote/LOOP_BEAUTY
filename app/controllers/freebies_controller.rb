class FreebiesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @freebies = policy_scope(Freebie)
  end
end
