class Admin::BasketsController < ApplicationController
  def index
    @baskets = policy_scope([:admin, Basket])
    @recovered_funds = @baskets.where(recovered: true).map(&:total_price).sum
    @recovered_orders = @baskets.where(recovered: true).size
    @total_emails = 0 #Count number of emails with email sent boolean
    @total_sales = @baskets.map(&:total_price).sum
  end
end
