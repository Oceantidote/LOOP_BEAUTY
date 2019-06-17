class Tutorial < ApplicationRecord
  include FriendlyId

  friendly_id :title, use: :slugged
  belongs_to :user
  has_one_attached :video
  has_one_attached :cover_photo
  has_many :tutorial_products
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
