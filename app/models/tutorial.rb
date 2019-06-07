class Tutorial < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  has_many :products, through: :tutorial_products

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
