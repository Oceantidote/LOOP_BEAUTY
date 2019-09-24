class Address < ApplicationRecord
  belongs_to :user
  # after_save :set_default_address
  # after_save :update_default_address
  validates :street, presence: true
  validates :city, presence: true
  validates :county, presence: true
  validates :postcode, presence: true
  validates :country, presence: true

  # def set_default_address
  #   if Address.where(user: user).where(delivery_address: true).count == 1
  #     self.update(default_address: true)
  #   end
  # end

  # def update_default_address
  #   if self.default_address == true
  #     user.addresses.where(default_address: true).where.not(id: self.id).update_all(default_address: false)
  #   end
  # end

  def destroy
    if Order.where(delivery_address: self).or(Order.where(billing_address: self)).any?
      update(deleted: true, default_address: false)
    else
      super
    end
  end
end
