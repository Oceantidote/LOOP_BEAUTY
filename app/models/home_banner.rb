class HomeBanner < ApplicationRecord
  has_one_attached :banner
  has_one_attached :mobile_banner
  validates :banner, attached: true
  validates :mobile_banner, attached: true
end
