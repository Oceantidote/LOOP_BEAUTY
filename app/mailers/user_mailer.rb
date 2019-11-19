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
end
