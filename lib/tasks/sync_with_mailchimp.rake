task sync_with_mailchimp: :environment do
  AddProductsToMailchimpJob.perform_later
end
