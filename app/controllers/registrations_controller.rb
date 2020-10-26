class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]

  def check_captcha
    unless verify_recaptcha(action: 'registration', minimum_score: 0.7)
      self.resource = resource_class.new sign_up_params
      resource.validate
      set_minimum_password_length
      respond_with_navigational(resource) { render :new }
    end
  end
end
