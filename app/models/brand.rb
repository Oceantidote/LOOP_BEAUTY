class Brand < ApplicationRecord
  include FriendlyId
  friendly_id :name, use: :slugged
  has_many :products, dependent: :destroy
  has_one_attached :photo
  has_one_attached :logo
  validates :name, :logo, :photo, :description, presence: true
  after_create :set_sku

  def set_sku
    self.update(sku: "BRANDSKU-00#{self.id}")
  end

  def self.product_filter(ids)
    return all if ids.empty?
    where(id: ids)
  end

  def self.product_filter_labels_and_values(original)
    all.map do |brand|
      [ brand.id, "#{brand.name} (#{original.where(brand: brand).size})" ]
    end
  end
end
