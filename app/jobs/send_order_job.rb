class SendOrderJob < ApplicationJob
  queue_as :default

  def perform(id)
    # Do something later
    order = Order.find(id)
    submit_order(order)
    order.new_order
  end

  private

  def submit_order(order)
    items = order.order_products.map do |item|
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
    to_submit = order_hash_builder(order)
    to_submit[:order][:items] = items
    response = JSON.parse(RestClient.post("https://api.controlport.co.uk/api/1/order", to_submit.to_json, {}).body)
    if order.locale == 'US'
      response['stock_changes'].each { |k,v| Shade.find_by_sku(k)&.update(us_number_in_stock: v) }
    else
      response['stock_changes'].each { |k,v| Shade.find_by_sku(k)&.update(number_in_stock: v) }
    end
    puts "XXXXXXXXXXXXXXXXXXX"
    puts response
  end

  def order_hash_builder(order)
    api_key = order.locale == 'US' ? ENV['US_CONTROLPORT_API_KEY'] : ENV['CONTROLPORT_API_KEY']
    timestamp = Time.now.to_i
    {
      half_api_key: api_key[0..15],
      message_timestamp: timestamp,
      security_hash: Digest::MD5.hexdigest(timestamp.to_s + api_key),
      test: !Rails.env.production? || ENV['TEST'],
      update_stock: true,
      order: {
        client_ref: "%05d" % (order.id ? order.id : 1),
        postage_speed: order.delivery_to_num,
        postage_cost: order.delivery_cost_cents / 100.to_f,
        total_value: order.total_price_cents / 100.to_f,
        currency_code: 'GBP',
        ShippingContact: {
          name: order.user.full_name,
          email: order.user.email,
          phone: order.delivery_address.phone_number,
          address: order.delivery_address.address_line1,
          city: order.delivery_address.city,
          county: order.delivery_address.county,
          country: order.delivery_address.country,
          postcode: order.delivery_address.postcode,
        },
        BillingContact: {
          name: order.user.full_name,
          email: order.user.email,
          phone: order.billing_address.phone_number,
          address: order.billing_address.address_line1,
          city: order.billing_address.city,
          county: order.billing_address.county,
          country: order.billing_address.country,
          postcode: order.billing_address.postcode
        }
      }
    }
  end
end
