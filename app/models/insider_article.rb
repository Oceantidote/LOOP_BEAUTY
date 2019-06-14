class InsiderArticle < ApplicationRecord
  belongs_to :user
  has_one_attached :cover_photo
  has_one_attached :photo1
  has_one_attached :photo2
  has_one_attached :photo3
  validates :cover_photo, presence: true
  validates :category, presence: true
  validates :by, presence: true
  validates :title, presence: true
  validates :cover_photo, presence: true
  validates :text1, presence: true


end
