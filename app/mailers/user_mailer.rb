class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    # @user = User.find(params[:user])
    # @article = InsiderArticle.find(params[:article])
    # @tutorial = Tutorial.find(params[:tutorial])

    @user = User.last
    @article = InsiderArticle.last
    @tutorial = Tutorial.first

    mail(to: @user.email, subject: 'Welcome to Loop Beauty')
  end

  def referral
    @user = User.find(params[:user])
    @discount = DiscountCode.find(params[:discount])
    mail(to: @user.email, subject: 'New Referral')
  end

  def content_approval
    @user = params[:user]
    @content = params[:content]
    mail(to: @user.email, subject: 'The status of your content has changed')
  end

  def order_confirmation
    @order = Order.find(params[:order])
    @user = User.find(params[:user])
    mail(to: @user.email, subject: "Order confirmation" )
  end

  def new_content
    @influencer = params[:influencer]
    @content = params[:content]
    @rejected = params[:rejected]
    if params[:rejected]
      mail(to: 'hello@myloopbeauty.com', subject: "#{@influencer.full_name} has edited a rejected #{@content.class.to_s}" )
    else
      mail(to: 'hello@myloopbeauty.com', subject: "#{@influencer.full_name} has shared a new #{@content.class.to_s}" )
    end
  end
end
