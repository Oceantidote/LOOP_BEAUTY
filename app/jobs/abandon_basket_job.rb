class AbandonBasketJob < ApplicationJob
  queue_as :default

  def perform(id)
    basket = Basket.find_by(id: id)
    return if basket.nil? || basket.empty? || !basket.abandonable?

    user = basket.user
    basket.update(abandoned: true, discount_code: nil, abandonable: false, recovered: false, abandoned_at: Time.current)
    Basket.create(user: user)
    schedule_email(basket)
  end

  def schedule_email(basket)
    user = basket.user
    client = MailchimpMarketing::Client.new(api_key: ENV['MAILCHIMP_API_KEY'], server: 'us19')
    begin
      client.ecommerce.get_store_customer(ENV['MAILCHIMP_STORE_ID'], user.id.to_s)
      customer_info = { id: user.id.to_s }
    rescue MailchimpMarketing::ApiError => e
      customer_info = {
        id: user.id.to_s,
        first_name: user.first_name,
        last_name: user.last_name,
        email_address: user.email,
        opt_in_status: false
      }
    end


    response = client.ecommerce.add_store_cart(
      ENV['MAILCHIMP_STORE_ID'],
      {
        id: basket.id.to_s,
        currency_code: 'GBP',
        customer: customer_info,
        order_total: basket.total_price_cents,
        lines: basket.to_mailchimp_cart_lines,
        checkout_url: "https://myloopbeauty.com/abandoned-bags/#{basket.id}"
      }
    )
    p response
  end
end
