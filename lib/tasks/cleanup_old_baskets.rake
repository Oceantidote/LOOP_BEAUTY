task cleanup_old_baskets: :environment do
  Basket.where(abandoned: true).where.not(abandoned_at: 3.months.ago..Time.current).destroy_all
end
