module Affiliation
    extend ActiveSupport::Concern

    included do
        has_many :orders, as: :affiliation
    end
end