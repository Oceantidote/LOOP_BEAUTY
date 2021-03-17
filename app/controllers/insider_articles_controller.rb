class InsiderArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  skip_before_action :verify_authenticity_token, only: [:show]

  def show
    @movies = ["webm", "mkv", "flv", "vob", "ogv", "ogg", "drc", "gif", "gifv", "mng", "avi", "mts", "m2ts", "mov", "qt", "wmv", "yuv", "rm", "rmvb", "asf", "amv", "mp4", "m4p", "m4v", "mpg", "mp2", "mpeg", "mpe", "mpv", "mpg", "mpeg", "m2v", "m4v", "svi", "3gp", "3g2", "mxf", "roq", "nsv", "flv", "f4v", "f4p", "f4a", "f4b" ]
    @insider_article = InsiderArticle.friendly.find(params[:id])
    # @user = User.find(@insider_article.by)
    @insider_articles = policy_scope(InsiderArticle)
    authorize @insider_article
  end

  def index
    # CREATE 'HOW TO' CATEGORY
    if params[:category].present? && params[:category] == "All"
      @contents = policy_scope(InsiderArticle)
    elsif params[:category].present? && params[:category] == "Inspiration"
      @contents = policy_scope(InsiderArticle).where(category: "Inspiration")
    elsif params[:category].present? && params[:category] == "News"
      @contents = policy_scope(InsiderArticle).where(category: "News")
    elsif params[:category].present? && params[:category] == "Ask the Expert"
      @contents = policy_scope(InsiderArticle).where(category: "Ask the Expert")
    elsif params[:category].present? && params[:category] == "How To"
      @contents = policy_scope(Tutorial).where(status: 'approved').order(created_at: :DESC)
      @how_to = params[:category]
    else
      @contents = policy_scope(InsiderArticle)
    end
    @contents += @contents
    @contents += @contents
    @featured_article = InsiderArticle.where(featured: true).first
    @featured_article_tag = @featured_article.text1.gsub(/<div>/, "").truncate(80)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
