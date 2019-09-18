class AddressesController < ApplicationController
  before_action :set_address, only: [:destroy]
  def create
    @address = Address.new(address_params)
    authorize @address
    @address.user = current_user
    if @address.save
      respond_to do |format|
        format.html { redirect_back fallback_location: user_account_details_path(current_user) }
        format.js
      end
    elsif @address.delivery_address
      @delivery_address = @address
      @billing_address = Address.new(delivery_address: false)
      render template: 'user/account_details'
    elsif @address.billing_address
      @billing_address = @address
      @delivery_address = Address.new(delivery_address: true)
      render template: 'user/account_details'
    else
      flash[:error] = 'Please fill out all fields'
    end
  end

  def destroy
    authorize @address
    @address.destroy
    redirect_back fallback_location: user_account_details_path(current_user)
  end

  def address_params
    params.require(:address).permit(:street, :street2, :city, :postcode, :delivery_address, :country, :county)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
