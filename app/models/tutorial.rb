class Tutorial < ApplicationRecord
  belongs_to :user
  has_many :products, through: :tutorial_products
end
