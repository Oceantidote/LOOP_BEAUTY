class FixMailchimpPricingJob < ApplicationJob
  queue_as :default

  def perform
    client = MailchimpMarketing::Client.new(api_key: ENV['MAILCHIMP_API_KEY'], server: 'us19')
    Shade.find_each do |shade|
      client.ecommerce.update_product_variant(ENV['MAILCHIMP_STORE_ID'], shade.product.id.to_s, shade.id.to_s, {
        price: (shade.product.price_cents / 100)
      })
    end
  end
end
