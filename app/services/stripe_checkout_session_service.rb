class StripeCheckoutSessionService
  def call(event)
    url = event.data.object.success_url
    order_id = url.match(/\/orders\/(\d+)\/order_success/)[1].to_i
    order = Order.find(order_id)
    order.update(status: 'paid')
    SendOrderJob.perform_later(order_id)
  end
end
