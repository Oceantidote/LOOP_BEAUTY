MoneyRails.configure do |config|
  config.default_currency = :gbp  # or :gbp, :usd, etc.
  Money.locale_backend = :currency
end
