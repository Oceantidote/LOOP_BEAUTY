class Tutorial < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  has_many :products, through: :tutorial_products
end
