class InsiderArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
end
