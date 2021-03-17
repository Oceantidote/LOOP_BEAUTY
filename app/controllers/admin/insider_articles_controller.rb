class Admin::InsiderArticlesController < ApplicationController
  before_action :set_insider_article, only: [:publish, :unpublish, :destroy, :edit, :update]

  def new
    @insider_article = InsiderArticle.new
    @influencers = User.where(influencer: true)
  end

  def index
    @insider_articles = InsiderArticle.all
  end

  def create
    @insider_article = InsiderArticle.new(insider_article_params)
    if @insider_article.save
      redirect_to insider_article_path(@insider_article)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @insider_article.update(insider_article_params)
      @insider_article.save
      redirect_to insider_article_path(@insider_article)
    else
      render :edit
    end
  end

  def destroy
    @insider_article.destroy
    redirect_to community_path
  end

  def publish
    @insider_article.published = true
    @insider_article.save
    redirect_to insider_article_path(@insider_article)
  end

  def unpublish
    @insider_article.published = false
    @insider_article.save
    redirect_to insider_article_path(@insider_article)
  end

  private

  def insider_article_params
    params.require(:insider_article).permit(
      :category,
      :by,
      :author_avatar,
      :title,
      :text1,
      :text2,
      :text3,
      :text4,
      :cover_photo,
      :mobile_cover_photo,
      :photo1,
      :photo2,
      :photo3,
      :cover_alt_text,
      :photo1_alt_text,
      :photo2_alt_text,
      :photo3_alt_text,
      :published,
      :homepage,
      :featured,
      :card_text_color,
      :article_date
    )
  end

  def set_insider_article
    @insider_article = InsiderArticle.friendly.find(params[:id])
    authorize [:admin, @insider_article]
  end
end
