class SubCategory < ApplicationRecord
  has_many :products
  belongs_to :category

  def self.product_filter(ids)
    return all if ids.empty?
    where(id: ids)
  end

  def self.product_filter_labels_and_values(original)
    all.map do |sub_category|
      [ sub_category.id, "#{sub_category.name.downcase} (#{original.where(sub_category: sub_category).size})" ]
    end
  end
end
