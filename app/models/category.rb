class Category < ApplicationRecord
  has_many :products
  has_many :sub_categories, dependent: :destroy
  validates :name, uniqueness: true

  def self.product_filter(ids)
    return all if ids.empty?
    where(id: ids)
  end

  def self.product_filter_labels_and_values(original)
    all.map do |category|
      [ category.id, "#{category.name} (#{original.where(category: category).size})" ]
    end
  end
end
