class StripeCheckoutSessionService
  def call(event)
    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    puts 'CALLED'
    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    url = event.data.object.success_url
    user_email = event.data.object.customer_email
    order_id = url.match(/\/orders\/(\d+)\/order_success/)[1].to_i
    order = Order.find(order_id)
    user = User.find_by(email: user_email)
    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    puts "order.completed = #{order.completed}"
    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    order.update(completed: true)
    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    puts "order.completed = #{order.completed}"
    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    order.update(discount_code: user.basket.discount_code)
    user.basket.empty!
    user.basket.update(discount_code: nil)
    user.orders.where(completed: false).destroy_all
    # order.update(status: 'paid')
    SendOrderJob.perform_later(order_id)
  end
end
