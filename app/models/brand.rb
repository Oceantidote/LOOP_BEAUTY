class Brand < ApplicationRecord
  include FriendlyId
  friendly_id :name, use: :slugged

  has_many :products
  has_one_attached :photo
  has_one_attached :logo
  validates :name, :logo, :photo, :description, presence: true

  def self.product_filter(ids)
    return all if ids.empty?
    where(id: ids)
  end
end
