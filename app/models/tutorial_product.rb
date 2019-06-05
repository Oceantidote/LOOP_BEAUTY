class TutorialProduct < ApplicationRecord
  belongs_to :tutorial
  belongs_to :product
end
