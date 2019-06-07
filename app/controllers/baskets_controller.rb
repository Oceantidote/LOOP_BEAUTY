class BasketsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @basket = find_basket
    authorize @basket
  end
end
