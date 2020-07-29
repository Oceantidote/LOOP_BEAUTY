class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_navbar_variables
  before_action :store_aff_code
  before_action :check_for_empty_orders
  before_action :not_seen_cookie_message, unless: -> { cookies[:seen_cookie_message] }
  before_action :first_time_visit, unless: -> { cookies[:not_first_visit] }
  include Pundit
  @influencers = User.where(influencer: true).where(published: true)
  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  before_action :configure_permitted_parameters, if: :devise_controller?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # rescue_from StandardError, with: :internal_server_error if Rails.env.production?

  def not_seen_cookie_message
    @not_seen_cookie = true
  end

  def first_time_visit
    cookies.permanent[:not_first_visit] = true
    @first_visit = true
  end

  def default_url_options
    { host: ENV['HOST'] || 'http://localhost:3000' }
  end

  private

  def internal_server_error(exception)
    unless Rails.env.development?
      slack_exception = "BUG REPORT -  " + exception.class.to_s + "    " + exception.message + "    " + params.inspect + exception.backtrace.join("\n")
      slack_post(slack_exception)
    end
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :country, :origin, :newsletter, :accepts_terms, :gender, :dob, :phone_number])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :country, :origin, :newsletter, :accepts_terms, :gender, :dob, :phone_number])
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def find_basket
    begin
    if current_user
      if current_user.basket && session[:basket_id]
        combine_baskets
      elsif current_user.basket
        current_user.basket
      elsif session[:basket_id]
        basket = Basket.find(session[:basket_id])
        session[:basket_id] = nil
        basket.update(user: current_user)
        basket
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
    rescue ActiveRecord::RecordNotFound
      basket = Basket.create
      session[:basket_id] = basket.id
      basket
    end
  end

  def combine_baskets
    old_basket = Basket.find(session[:basket_id])
    session[:basket_id] = nil
    new_basket = current_user.basket
    old_basket.basket_products.each do |item|
      item.update(basket: new_basket)
    end
    old_basket.destroy
    new_basket
  end

  def set_navbar_variables
    @brands = Brand.all.order(name: :ASC)
    @influencers = User.where(influencer: true, published: true).order(instagram: :ASC)
    @basket = find_basket
    @products = Product.all
  end

  def store_aff_code
    if params[:aff_code]
      session[:aff_code] = params[:aff_code]
      model = Lookbook.find_by_affiliate_code(params[:aff_code]).nil? ? Tutorial.find_by_affiliate_code(params[:aff_code]) : Lookbook.find_by_affiliate_code(params[:aff_code])
      model.increment!(:visits)
    end
  end

  def check_for_empty_orders
    return unless current_user.present?
    current_user.orders.includes(:order_products).where(order_products: { order_id: nil }).destroy_all
  end
end
