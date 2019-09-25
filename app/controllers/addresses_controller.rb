class AddressesController < ApplicationController
  before_action :set_address, only: [:destroy]
  def create
    @address = Address.new(address_params)
    authorize @address
    @address.user = current_user
    @user = current_user
    @order = Order.new
    if @address.save
      respond_to do |format|
        format.html { redirect_back fallback_location: user_account_details_path(current_user) }
        format.js
      end
      if @address.use_as_billing
        new_billing_address = Address.new(address_params)
        new_billing_address.user = current_user
        new_billing_address.delivery_address = false
        new_billing_address.save
      end
    elsif @address.delivery_address
      @delivery_address = @address
      @billing_address = Address.new(delivery_address: false)
      render template: 'orders/new'
    elsif @address.delivery_address == false
      @billing_address = @address
      @delivery_address = Address.new(delivery_address: true)
      render template: 'orders/new'
    else
      flash[:error] = 'Please fill out all fields'
    end
  end

  # def set_default
  #   @address = Address.find(params[:address_id])
  #   authorize @address
  #   @address.update(default_address: true)
  # end

  def destroy
    authorize @address
    @address.destroy
    redirect_back fallback_location: user_account_details_path(current_user)
  end

  def address_params
    params.require(:address).permit(:street, :street2, :city, :postcode, :delivery_address, :country, :county, :phone_number, :use_as_billing)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
