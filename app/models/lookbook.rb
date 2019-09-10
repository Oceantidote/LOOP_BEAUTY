class Lookbook < ApplicationRecord
  include FriendlyId
  include Affiliation

  friendly_id :title, use: :slugged
  belongs_to :user
  has_one_attached :photo
  has_many :lookbook_products
  has_many :products, through: :lookbook_products
  validates :title, uniqueness: true
  before_save :gen_aff_code

  def approve!
    code = gen_aff_code
    update(status: 'approved', affiliate_code: code, affiliate_link: Rails.application.routes.url_helpers.lookbook_path(self, aff_code: code))
  end

  def reject!
    update(status: 'rejected')
  end

  def submit_for_approval!
    update(status: 'pending')
  end

  def sales
    Order.where(affiliate_code: affiliate_code).size
  end

  def self.filter_sort(attr, direction)
    order(attr => direction.to_sym)
  end

  private

  def gen_aff_code
    code = [*(0..9), *('a'..'z'), *('A'..'Z')].sample(8).join
    if Lookbook.find_by_affiliate_code(code) || Tutorial.find_by_affiliate_code(code)
      gen_aff_code
    else
      code
    end
  end
end
