class InsiderArticle < ApplicationRecord
  belongs_to :user
  has_many_attached :photo
end