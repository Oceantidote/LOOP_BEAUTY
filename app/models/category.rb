class Category < ApplicationRecord
  has_many :products

  def self.product_filter(ids)
    return all if ids.empty?
    where(id: ids)
  end
end
