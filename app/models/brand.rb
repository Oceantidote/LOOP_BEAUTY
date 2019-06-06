class Brand < ApplicationRecord
  has_many :products
  has_one :photo
end
