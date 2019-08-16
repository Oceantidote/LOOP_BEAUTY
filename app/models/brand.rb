class Brand < ApplicationRecord
  include FriendlyId
  friendly_id :name, use: :slugged
  has_many :products
  has_one_attached :photo
  has_one_attached :logo
  validates :name, :logo, :photo, :description, presence: true

  def self.product_filter(ids)
    return all if ids.empty?
    where(id: ids)
  end

  def self.product_filter_labels_and_values(products, original, start)
    all.map do |brand|
      if start
        [ brand.id, "#{brand.name} (#{original.where(brand: brand).size})" ]
      else
        [ brand.id, "#{brand.name} (#{original.filter({brand: products.map(&:brand_id).uniq << brand.id}).size})" ]
      end
    end
  end
end
