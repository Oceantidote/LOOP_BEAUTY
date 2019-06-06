class Brand < ApplicationRecord
  include FriendlyId
  friendly_id :name, use: :slugged

  has_many :products
  has_one_attached :photo
end
