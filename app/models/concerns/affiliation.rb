module Affiliation
    extend ActiveSupport::Concern

    included do 
        has_many :orders, as: :affiliated_orders
    end
end