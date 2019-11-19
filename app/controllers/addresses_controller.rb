class AddressesController < ApplicationController
  before_action :set_address, only: [:destroy]
  def create
    @address = Address.new(address_params)
    authorize @address
    @address.user = current_user
    @user = current_user
    @order = Order.new

    if @address.save
      if (@address.delivery_address && @user.delivery_addresses.count == 1) || (!@address.delivery_address && @user.billing_addresses.count == 1)
        @address.update(default_address: true)
      end
      respond_to do |format|
        format.html { params[:address][:request_location] == "account_details" ? (redirect_to user_account_details_path(current_user, tab: "account-content-two")) : (redirect_back fallback_location: user_account_details_path(current_user)) }
        format.js
      end
      if @address.use_as_billing && @address.delivery_address
        new_billing_address = Address.new(address_params)
        new_billing_address.user = current_user
        new_billing_address.delivery_address = false
        new_billing_address.save
        if @user.billing_addresses.count == 1
          new_billing_address.update(default_address: true)
        end
      end
    elsif @address.delivery_address
      @delivery_address = @address
      @billing_address = Address.new(delivery_address: false)
      # render template: 'orders/new'
      redirect_back fallback_location: user_account_details_path(current_user)
    elsif @address.delivery_address == false
      @billing_address = @address
      @delivery_address = Address.new(delivery_address: true)
      # render template: 'orders/new'
      redirect_back fallback_location: user_account_details_path(current_user)
    else
      flash[:error] = 'Please fill out all fields'
    end
  end

  def set_default
    @address = Address.find(params[:address_id])
    authorize @address
    @user = @address.user
    @default_delivery = @user.addresses.where(delivery_address: true).where(default_address: true).first
    @default_billing = @user.addresses.where(delivery_address: false).where(default_address: true).first
    if @address.delivery_address
      @user.delivery_addresses.where.not(id: @address.id).update_all(default_address: false)
      @address.update(default_address: true)
      @default_is_delivery = true
    else
      @default_is_delivery = false
      @user.billing_addresses.where.not(id: @address.id).update_all(default_address: false)
      @address.update(default_address: true)
    end
    respond_to do |format|
      format.html { redirect_back fallback_location: checkout_path }
      format.js
    end
  end

  def destroy
    authorize @address
    @address.destroy
    redirect_back fallback_location: user_account_details_path(current_user)
  end

  def address_params
    params.require(:address).permit(:address_line1, :address_line2, :city, :postcode, :delivery_address, :country, :county, :phone_number, :use_as_billing)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
