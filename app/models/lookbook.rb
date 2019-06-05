class Lookbook < ApplicationRecord
  belongs_to :user
  has_many :lookbook_products
  has_many :products, through: :lookbook_products
end
