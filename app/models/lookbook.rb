class Lookbook < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :lookbook_products
  has_many :products, through: :lookbook_products

  def approve!
    update(status: 'approved')
  end

  def reject!
    update(status: 'rejected')
  end

  def submit_for_approval!
    update(status: 'pending')
  end
end
