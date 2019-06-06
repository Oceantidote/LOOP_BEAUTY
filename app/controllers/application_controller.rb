class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  before_action :configure_permitted_parameters, if: :devise_controller?


  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :country, :origin, :newsletter, :accepts_terms, :dob])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :country, :origin, :newsletter, :accepts_terms, :dob])
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def find_basket
    if current_user
      if current_user.basket && session[:basket_id]
        combine_baskets
      elsif current_user.basket
        current_user.basket
      elsif session[:basket_id]
        basket = Basket.find(session[:basket_id])
        session[:basket_id] = nil
        Basket.update(user: current_user)
      else
        Basket.create(user: current_user)
      end
    else
      if session[:basket_id] && Basket.find(session[:basket_id])
        Basket.find(session[:basket_id])
      else
        basket = Basket.create
        session[:basket_id] = basket.id
        basket
      end
    end
  end

  def combine_baskets
    old_basket = Basket.find(session[:basket_id])
    session[:basket_id] = nil
    new_basket = current_user.basket
    old_basket.basket_items.each do |item|
      item.update(basket: new_basket)
    end
    old_basket.destroy
    new_basket
  end
end
