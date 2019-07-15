class Category < ApplicationRecord
  has_many :products

  def self.product_filter(ids)
    return all if ids.empty?
    where(id: ids)
  end

  def self.product_filter_labels_and_values(products)
    all.map do |category|
      [ category.id, "#{category.name} (#{products.where(category: category).size})" ]
    end
  end
end
