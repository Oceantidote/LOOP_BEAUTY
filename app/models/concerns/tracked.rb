module Tracked
  extend ActiveSupport::Concern

  included do
      has_many :monthly_visits, as: :tracked
  end
end
