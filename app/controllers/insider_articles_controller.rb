class InsiderArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def show
    @movies = ["webm", "mkv", "flv", "vob", "ogv", "ogg", "drc", "gif", "gifv", "mng", "avi", "mts", "m2ts", "mov", "qt", "wmv", "yuv", "rm", "rmvb", "asf", "amv", "mp4", "m4p", "m4v", "mpg", "mp2", "mpeg", "mpe", "mpv", "mpg", "mpeg", "m2v", "m4v", "svi", "3gp", "3g2", "mxf", "roq", "nsv", "flv", "f4v", "f4p", "f4a", "f4b" ]
    @insider_article = InsiderArticle.find(params[:id])
    @user = User.find(@insider_article.by)
    @insider_articles = policy_scope(InsiderArticle)
    authorize @insider_article
  end

  def index
    if params[:category].present? && params[:category] == "All"
      @insider_articles = policy_scope(InsiderArticle)
    elsif params[:category].present? && params[:category] == "Inspiration"
      @insider_articles = policy_scope(InsiderArticle).where(category: "Inspiration")
    elsif params[:category].present? && params[:category] == "Beauty News"
      @insider_articles = policy_scope(InsiderArticle).where(category: "Beauty News")
    elsif params[:category].present? && params[:category] == "Ask the Expert"
      @insider_articles = policy_scope(InsiderArticle).where(category: "Ask the Expert")
    else
      @insider_articles = policy_scope(InsiderArticle)
    end
      @featured_article = InsiderArticle.where(featured: true).first

    respond_to do |format|
      format.html
      format.js
    end
  end
end
