class Address < ApplicationRecord
  belongs_to :user
  # after_save :set_default
  # after_save :update_default_address
  validates :address_line1, presence: true
  validates :city, presence: true
  validates :county, presence: true
  validates :postcode, presence: true
  validates :country, presence: true

  # def set_default
  #     self.update(default_address: true) if self.id == 1
  # end

  # def update_default_address
  #   if self.default_address == true
  #     user.addresses.where(default_address: true).where.not(id: self.id).update_all(default_address: false)
  #   end
  # end

  # def delivery_addresses
  #   self.user.addresses.where(default_address: true)
  # end

  # def billing_addresses
  #   self.user.addresses.where(default_address: false)
  # end

  def destroy
    if Order.where(delivery_address: self).or(Order.where(billing_address: self)).any?
      update(deleted: true, default_address: false)
    else
      super
    end
  end
end
