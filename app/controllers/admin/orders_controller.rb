class Admin::OrdersController < ApplicationController

  def destroy
    @order = Order.find(params[:id])
    authorize [:admin, @order]
    @order.destroy
    respond_to do |format|
      format.html { redirect_to admin_sales_report_path }
      format.js
    end
  end

end

