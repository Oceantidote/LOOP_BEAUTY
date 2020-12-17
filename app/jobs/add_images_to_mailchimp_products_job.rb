class AddImagesToMailchimpProductsJob < ApplicationJob
  queue_as :default

  def perform
    client = MailchimpMarketing::Client.new(api_key: ENV['MAILCHIMP_API_KEY'], server: 'us19')
    Product.find_each do |product|
      url = product.lead_product_image.attached? ? product.lead_product_image.blob.service_url : product.shades.first.photos.first&.blob&.service_url
      if url.nil?
        puts "Skipping #{product.title} - #{product.id}"
        next
      end
      client.ecommerce.update_store_product(ENV['MAILCHIMP_STORE_ID'], product.id.to_s, {
        image_url: url
      })
    end
  end
end
