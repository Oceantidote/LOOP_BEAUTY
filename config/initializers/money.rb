MoneyRails.configure do |config|
  config.default_currency = :gbp  # or :gbp, :usd, etc.
  config.no_cents_if_whole = false
  Money.locale_backend = :currency
end
