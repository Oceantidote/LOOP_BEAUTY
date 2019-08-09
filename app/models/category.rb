class Category < ApplicationRecord
  has_many :products

  def self.product_filter(ids)
    return all if ids.empty?
    where(id: ids)
  end

  def self.product_filter_labels_and_values(products, original, start)
    all.map do |category|
      if start
        [ category.id, "#{category.name} (#{original.where(category: category).size})" ]
      else
        [ category.id, "#{category.name} (#{original.filter({category: products.map(&:category_id).uniq << category.id}).size})" ]
      end
    end
  end
end
