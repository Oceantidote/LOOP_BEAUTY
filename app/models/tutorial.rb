class Tutorial < ApplicationRecord
  include FriendlyId

  friendly_id :title, use: :slugged
  belongs_to :user
  has_one_attached :video
  has_one_attached :cover_photo
  has_many :tutorial_products, dependent: :destroy
  has_many :products, through: :tutorial_products
  validates :title, uniqueness: true
  def approve!
    update(status: 'approved', rejection_message: nil)
  end

  def reject!
    update(status: 'rejected')
  end

  def submit_for_approval!
    update(status: 'pending')
  end
end
