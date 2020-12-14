class AbandonBasketJob < ApplicationJob
  queue_as :default

  def perform(id)
    basket = Basket.find_by(id: id)
    return if basket.nil? || basket.empty? || !basket.abandonable?

    user = basket.user
    basket.update(abandoned: true, discount_code: nil, abandonable: false, recovered: false, abandoned_at: Time.current)
    Basket.create(user: user)
  end
end
