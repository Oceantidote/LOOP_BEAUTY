class HomeBanner < ApplicationRecord
  has_one_attached :banner
  has_one_attached :mobile_banner
  has_one_attached :ipad
  has_one_attached :ipadpro
  has_one_attached :ipadx
  has_one_attached :iphone
  has_one_attached :iphonese
  has_one_attached :pixel
  has_one_attached :galaxy
  validates :banner, attached: true
  validates :mobile_banner, attached: true
  validates :ipad, attached: true, content_type: ['image/png', 'image/jpg'],
                                     dimension: { width: 768, height: 924 }
  validates :ipadpro, attached: true, content_type: ['image/png', 'image/jpg'],
                                     dimension: { width: 1024, height: 1266 }
  validates :ipadx, attached: true, content_type: ['image/png', 'image/jpg'],
                                     dimension: { width: 375, height: 712 }
  validates :iphone, attached: true, content_type: ['image/png', 'image/jpg'],
                                     dimension: { width: 375, height: 567 }
  validates :iphonese, attached: true, content_type: ['image/png', 'image/jpg'],
                                     dimension: { width: 320, height: 468 }
  validates :pixel, attached: true, content_type: ['image/png', 'image/jpg'],
                                     dimension: { width: 411, height: 631 }
  validates :galaxy, attached: true, content_type: ['image/png', 'image/jpg'],
                                     dimension: { width: 360, height: 540 }
end
