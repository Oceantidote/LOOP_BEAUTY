class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :make_up]
  before_action :set_nested_user, only: [:uploads, :share, :dashboard, :my_orders, :my_products, :refer_a_friend, :wishlist, :account_details, :preference_centre, :analytics, :showroom]
  before_action :set_user, only: [:show, :make_up, :q_and_a]
  before_action :set_wishlist, only: [:wishlist]
  skip_before_action :verify_authenticity_token, only: [:show]

  def dashboard
  end

  def my_orders
    @orders = Order.where(user: @user, completed: true).order(created_at: :DESC).page params[:page]
  end

  def my_products
    # @orders = Order.where(user: @user)
    @products = Order.where(user: @user).order(created_at: :DESC).map { |order| order.products }.flatten.uniq
    @products = Kaminari.paginate_array(@products).page(params[:page]).per(3)
  end

  def refer_a_friend
  end

  def wishlist
  end

  def account_details
    @delivery_address = Address.new(delivery_address: true)
    @billing_address = Address.new(delivery_address: false)
  end

  def preference_centre
  end

  def analytics
    @range_value = params.dig(:analytics, :range)
    @range = @range_value == 'ytd' ? (Date.today.last_year.beginning_of_day..Date.today.end_of_day) : (Date.today.beginning_of_month.beginning_of_day..Date.today.end_of_day)
    @lookbooks = Lookbook.where(user: @user, status: 'approved')
    @tutorials = Tutorial.where(user: @user, status: 'approved')
    @lookbooks_in_range = @lookbooks.where(created_at: @range)
    @tutorials_in_range = @tutorials.where(created_at: @range)
    @orders = Order.where(affiliation_type: 'Lookbook', affiliation_id: @lookbooks.ids).or(Order.where(affiliation_type: 'Tutorial', affiliation_id: @tutorials.ids)).or(Order.where(affiliation_type: 'User', affiliation_id: current_user.id))
    @orders_this_period = @orders.where(created_at: @range)
    @number_of_content_shared = @lookbooks_in_range.count + @tutorials_in_range.count
    @total_visits = Lookbook.total_visits_this_period(@lookbooks, @range) + Tutorial.total_visits_this_period(@tutorials, @range)
    @total_sales = @orders_this_period.size
    @top_content = (@lookbooks_in_range.order(:visits).last(3) + @tutorials_in_range.order(:visits).last(3)).sort_by(&:visits).last(3).reverse
    @total_conversion_rate = @total_visits.zero? ? 0 : ((@total_sales / @total_visits.to_f) * 100).round(2)
    @top_brands_count = []
    @top_brands = []
    @orders_this_period.each do |order|
      order.products.each do |product|
        @top_brands << product.brand.name
      end
    end
    Brand.all.each do |brand|
      @top_brands_count << [brand.name, @top_brands.count(brand.name)]
    end
    @top_brands_count = @top_brands_count.sort_by {|i| i[1]}.reverse
    @top_lookbooks = @lookbooks_in_range.sort_by { |lb| -lb.orders.count }.first(3)
    @top_items_count = []
    @top_items = []
    @orders_this_period.each do |order|
      order.products.each do |product|
        @top_items << product.category.name
      end
    end
    Category.all.each do |category|
      @top_items_count << [category.name, @top_items.count(category.name)]
    end
    @top_items_count = @top_items_count.sort_by {|i| i[1]}.reverse
    if params.dig(:analytics, :range) == 'ytd'
      @commission_this_month = @orders_this_period.joins(:order_products).joins(:products).group_by_month(:created_at, format: '%b', range: @range).sum(
        "((((order_products.quantity * products.price_cents) / 12) * 10) * (#{@user.commission_rate || 0} / 100)) / 100"
      )
      @commission_this_month[Date.today.strftime('%b')] = @commission_this_month.delete(Date.today.strftime('%b'))
      @orders_graph_data = @orders_this_period.group_by_month(:created_at, format: '%b', range: @range).count
      @orders_graph_data[Date.today.strftime('%b')] = @orders_graph_data.delete(Date.today.strftime('%b'))
    else
      @commission_this_month = @orders_this_period.joins(:order_products).joins(:products).group_by_day(:created_at, format: '%-d/%-m', range: @range).sum(
        "((((order_products.quantity * products.price_cents) / 12) * 10) * (#{@user.commission_rate || 0} / 100)) / 100"
      )
      @orders_graph_data = @orders_this_period.group_by_day(:created_at, format: '%-d/%-m', range: @range).count
    end
    @commission_this_month.each { |k,v| @commission_this_month[k] = v.to_f }
  end

  def showroom
    @products = Product.where(demoable: true).page params[:page]
    @original = Product.where(demoable: true)
    @all = @original
    @products = policy_scope(Product).filter(params[:product].slice(:sub_category, :brand)) if params[:product].present?
    @products = @products.page params[:page]
    @products_count = @products.count
    if params[:product].present? && params[:product][:sort].present?
      @products = @products.filter_sort(*sort_params).page params[:page]
      @products_count = @products.filter_sort(*sort_params).count
      @sort_method = params[:product][:sort][:method]
    else
      @products = @products.filter_sort(*'created_at,desc'.split(',')).page params[:page]
      @products_count = @products.count
      @sort_method = 'created_at,desc'
    end
  end

  def uploads
    @pending = current_user.tutorials.where(status: 'pending').to_a
    @pending = @pending + current_user.lookbooks.where(status: 'pending').to_a
    @pending = @pending.sort_by { |content| content.updated_at.to_i * -1 }
    @rejected = current_user.tutorials.where(status: 'rejected').to_a
    @rejected = @rejected + current_user.lookbooks.where(status: 'rejected').to_a
    @rejected = @rejected.sort_by { |content| content.updated_at.to_i * -1 }
    @approved = current_user.tutorials.where(status: 'approved').to_a
    @approved = @approved + current_user.lookbooks.where(status: 'approved').to_a
    @approved = @approved.sort_by { |content| content.updated_at.to_i * -1 }
  end

  def update
    authorize current_user
    if current_user.update(user_params)
      redirect_to user_account_details_path(current_user)
    else
      render :account_details
    end
  end

  def change_password
    authorize current_user
    if current_user.valid_password?(password_params[:old_password])
      if password_params[:password] == password_params[:password_confirmation]
        current_user.update(password: password_params[:password])
        bypass_sign_in current_user
        redirect_to user_account_details_path(current_user)
        flash[:notice] = 'Password changed'
      else
        flash[:error] = 'Passwords do not match'
        render :account_details
      end
    else
      flash[:error] = 'Password was incorrect'
      render :account_details
    end
  end

  def newsletter
    authorize current_user
    current_user.update(newsletter: params[:user][:newsletter])
    respond_to do |format|
      format.js
      format.html { redirect_to user_preference_centre_path(current_user), notice: params[:user][:newsletter] == '1' ? 'Subscribed' : 'Unsubscribed' }
    end
  end

  def share
  end

  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE
  def show
  end

  def index
    @users = policy_scope(User).where(influencer: true).order(instagram: :asc)
  end

  def make_up
    @showroom_products = @user.showroom.showroom_products
    @products = @user.showroom.products.page params[:page]
    @original = @products
    @all = @original
    @demoable_products = Product.all - @products
    @products = @products.filter(params[:product].slice(:category, :brand)).page params[:page] if params[:product].present?
    if params[:product].present? && params[:product][:sort].present?
      @products = @products.filter_sort(*sort_params).page params[:page]
      @sort_method = params[:product][:sort][:method]
    else
      # @products = @products.filter_sort(*'created_at,desc'.split(','))
      @sort_method = 'created_at,desc'
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE

  def q_and_a
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
    authorize @user
  end

  def set_wishlist
    @wishlist = Wishlist.find_by(user: @user)
    @wishlist_products = @wishlist.wishlist_products.page(params[:page])
    # WISHLIST TEST
  end

  def set_nested_user
    if params[:user_id]
      @user = User.friendly.find(params[:user_id])
    else
      @user = User.friendly.find(params[:id])
    end
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :dob)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation, :old_password)
  end

  def sort_params
    params[:product][:sort][:method].split(',')
  end
end
