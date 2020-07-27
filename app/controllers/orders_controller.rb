class OrdersController < ApplicationController
  before_action :set_user_and_address, only: [:create] # BEN WRIGHT CONFIRM PLEASE THANKS
  skip_before_action :check_for_empty_orders, only: [:order_success]
  def index
    @orders = policy_scope(Order).where(user: current_user, completed: true)
    authorize @orders
  end

  def new
    @basket = find_basket
    @user = @basket.user # to be reviewed
    @order = Order.new
    @address = Address.new # to be reviewed
    @default_delivery = @user.addresses.where(delivery_address: true).where(default_address: true).first
    @default_billing = @user.addresses.where(delivery_address: false).where(default_address: true).first
    authorize @order
  end

  def create
    @basket = find_basket
    @order = Order.new(order_params.slice(:delivery_address_id, :billing_address_id, :delivery_type))
    @order.user = current_user
    # @order.status = 'pending'
    @order.discount_code = @basket.discount_code
    if @basket.basket_products.any?(&:purchase_with_credit?)
      @order.delivery_cost_cents = 0
    else
      @order.set_delivery_costs_cents
    end
    authorize @order
    if session[:aff_code]
      affiliation = Tutorial.find_by_affiliate_code(session[:aff_code]).present? ? Tutorial.find_by_affiliate_code(session[:aff_code]) : Lookbook.find_by_affiliate_code(session[:aff_code])
      @order.affiliation = affiliation
      session[:aff_code] = nil
    end
    @order.credit_spent = @basket.money_off_from_credit
    unless @order.save
      flash[:alert] = @order.errors.full_messages.join(', ')
      render :new and return
    end
    CleanUpIncompleteOrderJob.set(wait: 2.hours).perform_later(@order.id)
    @basket.basket_products.each do |item|
      order_product = item.convert_to_order_product
      order_product.order = @order
      order_product.save
    end
    # @basket.empty!
    # @basket.update(discount_code: nil)
    if @order.total_price > 0
      launch_session
    else
      @basket.empty!
      @basket.update(discount_code: nil)
      @order.update(completed: true)
      redirect_to order_order_success_path(@order)
    end
  end

  def show
    @order = Order.find(params[:id])
    @user = @order.user
    authorize @order
  end

  def order_success
    @order = Order.find(params[:order_id])
    @user = @order.user
    authorize @order
  end

  def pay
    @order = Order.find(params[:id])
    authorize @order
    launch_session
  end

  private

  def launch_session
    credit = @order.credit_spent_cents
    items = @order.order_products.map do |item|
      if credit > 0 && item.purchase_with_credit?
        if credit >= item.price_cents
          amount = 0
          credit -= item.price_cents
        else
          amount = item.price_cents - credit
          credit = 0
        end
      else
        amount = item.price_cents
      end
      next if amount < 1
      {
        name: "#{item.shade.name.present? ? item.shade.name : item.product.title} × #{item.quantity}",
        amount: amount,
        currency: 'gbp',
        quantity: 1
      }
    end
    items.reject!(&:nil?)
    items << {name: 'Delivery', amount: @order.delivery_cost_cents, currency: 'gbp', quantity: 1} if @order.delivery_cost_cents > 0
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: items,
      success_url: order_order_success_url(@order),
      cancel_url: checkout_url,
      customer_email: current_user.email,
    })
    @order.update(discount_code: nil)
  end

  def set_user_and_address # BEN WRIGHT CONFIRM PLEASE THANKS
    @user = @basket.user
    @address = Address.new
  end

  def order_params
    params.require(:order).permit(:delivery_address_id, :billing_address_id, :phone_number, :delivery_type, stripe: [:stripe_email, :stripe_token] )
  end

  def find_stripe_user(email, token = nil)
    if current_user.stripe_id.nil?
      customer = Stripe::Customer.create(
        source: token,
        email: email
      )
      current_user.update(stripe_id: customer.id)
      customer
    else
      Stripe::Customer.retrieve(current_user.stripe_id)
    end
  end
end
