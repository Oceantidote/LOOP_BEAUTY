class AddProductsToMailchimpJob < ApplicationJob
  queue_as :default

  def perform
    client = MailchimpMarketing::Client.new(api_key: ENV['MAILCHIMP_API_KEY'], server: 'us19')
    products = Product.all
    products.each do |product|
      begin
        client.ecommerce.get_store_product(ENV['MAILCHIMP_STORE_ID'], product.id.to_s)
      rescue MailchimpMarketing::ApiError => e
        if e.status == 404
          client.ecommerce.add_store_product(ENV['MAILCHIMP_STORE_ID'], {
            id: product.id.to_s,
            title: product.title,
            handle: product.slug,
            description: product.details,
            variants: product.shades.map(&:to_mailchimp_detail)
          })
        else
          raise e
        end
      end

      product.shades.each do |shade|
        begin
          client.ecommerce.get_product_variant(ENV['MAILCHIMP_STORE_ID'], product.id.to_s, shade.id.to_s)
        rescue MailchimpMarketing::ApiError => e
          if e.status == 404
            client.ecommerce.add_product_variants(ENV['MAILCHIMP_STORE_ID'], product.id.to_s, shade.to_mailchimp_detail)
          else
            raise e
          end
        end
      end
    end
  end
end
