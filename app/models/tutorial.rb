class Tutorial < ApplicationRecord
  include FriendlyId

  friendly_id :title, use: :slugged
  belongs_to :user
  has_one_attached :video
  has_one_attached :cover_photo
  has_many :tutorial_products, dependent: :destroy
  has_many :products, through: :tutorial_products
  validates :title, uniqueness: true
  after_save :update_featured

  def approve!
    code = gen_aff_code
    update(status: 'approved', rejection_message: nil, affiliate_code: code, affiliate_link: Rails.application.routes.url_helpers.tutorial_path(self, aff_code: code))
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

  def update_featured
    @tutorials = Tutorial.where(featured: true).where.not(id: self.id)
    @tutorials.update_all(featured: false)
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
