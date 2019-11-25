class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Loop Beauty')
  end

  def referral
    @user = params[:user]
    @discount = params[:discount]
    mail(to: @user.email, subject: 'New Referral')
  end

  def content_approval
    @user = params[:user]
    @content = params[:content]
    mail(to: @user.email, subject: 'The status of your content has changed')
  end

  def order_confirmation
    @order = params[:order]
    # @order_products = params[:order].order_products
    @user = params[:user]
    puts 'HELLOOOOOOOOOOOOOO'
    puts @order
    puts @order.order_products.count
    mail(to: @user.email, subject: "Order confirmation" )
  end

  def new_content
    @influencer = params[:influencer]
    @content = params[:content]
    @rejected = params[:rejected]
    if params[:rejected]
        mail(to: 'hello@loopbeauty.co.uk', subject: "#{@influencer.full_name} has edited a rejected #{@content.class.to_s}" )
      else
        mail(to: 'hello@loopbeauty.co.uk', subject: "#{@influencer.full_name} has shared a new #{@content.class.to_s}" )
      end
  end
end
