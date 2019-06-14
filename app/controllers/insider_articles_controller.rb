class InsiderArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]


  def show
    @movies = ["webm", "mkv", "flv", "vob", "ogv", "ogg", "drc", "gif", "gifv", "mng", "avi", "mts", "m2ts", "mov", "qt", "wmv", "yuv", "rm", "rmvb", "asf", "amv", "mp4", "m4p", "m4v", "mpg", "mp2", "mpeg", "mpe", "mpv", "mpg", "mpeg", "m2v", "m4v", "svi", "3gp", "3g2", "mxf", "roq", "nsv", "flv", "f4v", "f4p", "f4a", "f4b" ]
    @insider_article = InsiderArticle.find(params[:id])
    @insider_articles = policy_scope(InsiderArticle)
    authorize @insider_article
  end

  def index
    @insider_articles = policy_scope(InsiderArticle)
    @featured_article = @insider_articles.sample
  end

end
