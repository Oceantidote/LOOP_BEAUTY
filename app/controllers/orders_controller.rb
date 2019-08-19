class OrdersController < ApplicationController

  def index
    @orders = policy_scope(Order).where(user: current_user)
    authorize @orders
  end

  def new
    @basket = find_basket
    @user = @basket.user
    @order = Order.new
    @address = Address.new
    authorize @order
  end

  def create
    @basket = find_basket
    @order = Order.new(order_params.slice(:phone_number, :delivery_address_id, :billing_address_id, :delivery_type))
    @order.user = current_user
    @order.set_delivery_costs_cents
    authorize @order
    unless @basket.total_price <= 0
      stripe_user = find_stripe_user(order_params[:stripe][:stripe_email], order_params[:stripe][:stripe_token])
      charge = Stripe::Charge.create(
        customer: stripe_user.id,
        amount: @basket.total_price_cents + @order.delivery_cost_cents,
        currency: @basket.total_price.currency
      )
      @order.stripe_id = charge.id
      @order.affiliate_code = session[:aff_code]
    end
    @order.credit_spent = @basket.money_off_from_credit
    if @order.save!
      unless @basket.subtotal - @order.credit_spent <= 0
        Stripe::Charge.update(
          charge.id,
          {
            description: "Payment for order #{@order.id} from #{current_user.email}"
          }
        )
      end
      @basket.basket_products.each do |item|
        order_product = item.convert_to_order_product
        order_product.order = @order
        order_product.save
      end
      @basket.empty!
      submit_order
      # redirect_to order_path(@order)
      redirect_to order_order_success_path(@order)
    else
      flash[:error] = 'Error!'
      render :new
    end
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to checkout_path
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def order_success
    @order = Order.find(params[:order_id])
    @user = @order.user
    authorize @order
  end

  private

  def submit_order
    timestamp = Time.now.to_i
    items = @order.order_products.map do |item|
      if @order.discount_code.present?
        price = (item.product.price_cents * (1 - @order.discount_code.discount * 0.01)) / 100.to_f
      elsif item.purchase_with_credit
        price = 0
      else
        price = item.product.price_cents / 100.to_f
      end
      {
        client_ref: item.product.sku,
        quantity: item.quantity,
        price: price
      }
    end
    to_submit = order_hash_builder
    to_submit[order][items] = items
    response = RestClient.post("https://api.controlpost.co.uk/api/1/order", to_submit.to_json, {})
  end

  def order_hash_builder
    {
      half_api_key: "key",
      message_timestamp: timestamp,
      secure_hash: Digest::MD5.hexdigest(timestamp.to_s + "key_for_site"),
      test: true,
      order: {
        client_ref: "%05d" % @order.id,
        postage_speed: @order.delivery_to_num,
        postage_cost: @order.delivery_cost_cents / 100.to_f,
        total_value: @order.total_price_cents / 100.to_f,
        currency_code: 'GBP',
        ShippingContact: {
          name: @order.user.full_name,
          email: @order.user.email,
          phone: @order.phone_number,
          address: @order.delivery_address.street,
          city: @order.delivery_address.city,
          county: @order.delivery_address.county,
          country: @order.delivery_address.country,
          postcode: @order.delivery_address.postcode
        },
        BillingContact: {
          name: @order.user.full_name,
          email: @order.user.email,
          phone: @order.phone_number,
          address: @order.billing_address.street,
          city: @order.billing_address.city,
          county: @order.billing_address.county,
          country: @order.billing_address.country,
          postcode: @order.billing_address.postcode
        }
      }
    }
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
