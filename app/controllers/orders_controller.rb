class OrdersController < ApplicationController
  before_action :set_user_and_address, only: [:create] # BEN WRIGHT CONFIRM PLEASE THANKS
  skip_before_action :check_for_empty_orders, only: [:order_success]
  def index
    @orders = policy_scope(Order).where(user: current_user)
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
    @basket.basket_products.all?(&:purchase_with_credit?) && @basket.total_price_cents == 0 ? @order.delivery_cost_cents = 0 : @order.set_delivery_costs_cents
    authorize @order
    if session[:aff_code]
      affiliation = Tutorial.find_by_affiliate_code(session[:aff_code]).present? ? Tutorial.find_by_affiliate_code(session[:aff_code]) : Lookbook.find_by_affiliate_code(session[:aff_code])
      @order.affiliation = affiliation
      session[:aff_code] = nil
    end
    unless @order.save
      flash[:alert] = @order.errors.full_messages.join(', ')
      render :new and return
    end
    if @basket.total_price > 0

      items = @basket.basket_products.map do |item|
        {
          name: item.shade.name.present? ? item.shade.name : item.product.title,
          amount: item.individual_price_cents,
          currency: 'gbp',
          quantity: item.quantity
        }
      end
      items << {name: 'Delivery', amount: @order.delivery_cost_cents, currency: 'gbp', quantity: 1} if @order.delivery_cost_cents > 0
      @session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        line_items: items,
        success_url: order_order_success_url(@order),
        cancel_url: checkout_url,
        customer_email: current_user.email,
      })
      raise
    else
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
    unless @order.processed?
      @order.credit_spent = @basket.money_off_from_credit
      @order.processed = true
      @order.save
      @basket.basket_products.each do |item|
        order_product = item.convert_to_order_product
        order_product.order = @order
        order_product.save
      end
      @basket.empty!
      submit_order
    end
    @user = @order.user
    authorize @order
  end

  private

  def submit_order
    items = @order.order_products.map do |item|
      if item.purchase_with_credit
        price = 0
      else
        price = item.product.price_cents / 100.to_f
      end
      {
        client_ref: item.shade.sku,
        quantity: item.quantity,
        price: price
      }
    end
    to_submit = order_hash_builder
    to_submit[:order][:items] = items
    response = JSON.parse(RestClient.post("https://api.controlport.co.uk/api/1/order", to_submit.to_json, {}).body)
    response['stock_changes'].each { |k,v| Shade.find_by_sku(k)&.update(number_in_stock: v) }
  end

  def order_hash_builder
    timestamp = Time.now.to_i
    {
      half_api_key: ENV['CONTROLPORT_API_KEY'][0..15],
      message_timestamp: timestamp,
      security_hash: Digest::MD5.hexdigest(timestamp.to_s + ENV['CONTROLPORT_API_KEY']),
      test: true,
      update_stock: true,
      order: {
        client_ref: "%05d" % (@order.id ? @order.id : 1),
        postage_speed: @order.delivery_to_num,
        postage_cost: @order.delivery_cost_cents / 100.to_f,
        total_value: @order.total_price_cents / 100.to_f,
        currency_code: 'GBP',
        ShippingContact: {
          name: @order.user.full_name,
          email: @order.user.email,
          phone: @order.delivery_address.phone_number,
          address: @order.delivery_address.address_line1,
          city: @order.delivery_address.city,
          county: @order.delivery_address.county,
          country: @order.delivery_address.country,
          postcode: @order.delivery_address.postcode,
        },
        BillingContact: {
          name: @order.user.full_name,
          email: @order.user.email,
          phone: @order.billing_address.phone_number,
          address: @order.billing_address.address_line1,
          city: @order.billing_address.city,
          county: @order.billing_address.county,
          country: @order.billing_address.country,
          postcode: @order.billing_address.postcode
        }
      }
    }
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
