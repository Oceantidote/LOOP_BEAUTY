desc 'Update Stock'
task check_stock: :environment do
    timestamp = Time.now.to_i
puts ENV['CONTROLPORT_API_KEY'][0..15]
    url = "https://api.controlport.co.uk/api/1/stock?half_api_key=#{ENV['CONTROLPORT_API_KEY'][0..15]}
                                                    &message_timestamp=#{timestamp}
                                                    &security_hash=#{Digest::MD5.hexdigest(timestamp.to_s + ENV['CONTROLPORT_API_KEY'])}
                                                    &test=true
                                                    &subtract_needed=true"
    response = RestClient.get(url.gsub(/(\n|\s)/, ''), {})
    JSON.parse(response.body)['stock'].each { |k,v| Shade.find_by_sku(k)&.update(number_in_stock: v) }
end
