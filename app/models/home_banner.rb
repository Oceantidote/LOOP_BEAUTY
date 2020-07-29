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
  has_one_attached :pixel2
  has_one_attached :pixel3
  has_one_attached :galaxy2
  has_one_attached :galaxymini
  has_one_attached :flexi
  has_one_attached :iphone9
  has_one_attached :iphone10
  has_one_attached :tablet
  has_one_attached :tabletlrg
  has_one_attached :tabletpan

  validates :banner, attached: true
  validates :mobile_banner, attached: true
  validates :iphonese, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 320, height: 468 }
  validates :galaxymini, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 360, height: 440 }
  validates :galaxy, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 360, height: 540 }
  validates :iphone10, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 375, height: 467 }
  validates :iphone, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 375, height: 567 }
  validates :iphone9, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 375, height: 612 }
  validates :ipadx, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 375, height: 712 }
  validates :pixel, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 411, height: 631 }
  validates :pixel3, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 412, height: 624 }
  validates :pixel2, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 412, height: 647 }
  validates :flexi, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 414, height: 696 }
  validates :galaxy2, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 480, height: 653 }
  validates :tablet, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 600, height: 760 }
  validates :ipad, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 768, height: 924 }
  validates :tabletlrg, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 800, height: 1180 }
  validates :ipadpro, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 1024, height: 1266 }
  validates :tabletpan, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: 1280, height: 650 }
end
