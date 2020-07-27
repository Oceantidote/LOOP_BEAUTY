class CleanUpIncompleteOrderJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    order = Order.find(order_id)
    order.destroy unless order.completed?
  end
end
