# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    UserMailer.welcome
  end

  def welcome_influencer
    UserMailer.welcome_influencer
  end

  def referral
    UserMailer.referral
  end

  def content_approval
    UserMailer.content_approval
  end

  def order_confirmation
    UserMailer.order_confirmation
  end

  def new_content
    UserMailer.new_content
  end
end
