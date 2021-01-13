require 'csv'

class Admin::BasketsController < ApplicationController
  skip_after_action :verify_authorized, only: [:download]

  def index
    @baskets = policy_scope([:admin, Basket]).order(:abandoned_at)
    @from = params.dig(:filter, :from)
    @to = params.dig(:filter, :to)
    if @from && @to
      @baskets = @baskets.where(abandoned_at: @from..@to)
    end
    @recovered_funds = @baskets.where(recovered_completed: true).map(&:total_price).sum
    @recovered_orders = @baskets.where(recovered_completed: true).size
    @total_emails = 0 #Count number of emails with email sent boolean
    @total_sales = @baskets.map(&:total_price).sum
  end

  def download
    @baskets = policy_scope([:admin, Basket]).order(:abandoned_at)
    if params[:from] && params[:to]
      @baskets = @baskets.where(abandoned_at: params[:from]..params[:to])
    end
    download = CSV.generate(headers: true) do |csv|
      csv << [:id, :date, :placed_by, :email_address, :email_status, :recovery_status, :total]
      @baskets.each do |basket|
        csv << [basket.id, basket.abandoned_at.strftime('%d/%m/%Y'), basket.user.full_name, basket.user.email, basket.email_status, basket.recovery_status, helpers.humanized_money_with_symbol(basket.total_price)]
      end
    end
    respond_to do |format|
      format.csv { send_data download, filename: "abandoned-bags-#{Date.today.strftime("%Y%m%d")}.csv" }
    end
  end
end
