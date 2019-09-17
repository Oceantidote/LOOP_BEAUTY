class Address < ApplicationRecord
  belongs_to :user
  after_save :update_default_address

  def update_default_address
    if self.default_address == true
      @addresses = Address.where(default_address: true).where.not(id: self.id)
      @addresses.update_all(default_address: false)
    end
  end
end
