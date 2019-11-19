class MonthlyVisit < ApplicationRecord
  belongs_to :tracked, polymorphic: true
end
