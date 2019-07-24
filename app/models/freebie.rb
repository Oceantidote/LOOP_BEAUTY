class Freebie < ApplicationRecord
  belongs_to :discount_code
  has_one_attached :banner

end
