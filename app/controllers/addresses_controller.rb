class AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    authorize @address
    @address.user = current_user
    if @address.save
      redirect_back fallback_location: user_account_details_path(current_user)
    elsif @address.delivery_address
      @delivery_address = @address
      @billing_address = Address.new(delivery_address: false)
      render template: 'user/account_details'
    else
      @billing_address = @address
      @delivery_address = Address.new(delivery_address: true)
      render template: 'user/account_details'
    end
  end

  def destroy
  end

  def address_params
    params.require(:address).permit(:street, :city, :postcode, :delivery_address)
  end
end
