class InsiderArticle < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_one_attached :author_avatar
  has_one_attached :cover_photo
  has_one_attached :photo1
  has_one_attached :photo2
  has_one_attached :photo3
  validate :cover_validation
  validates :category, presence: true
  validates :by, presence: true
  validates :title, presence: true
  validates :text1, presence: true
  after_save :update_featured

  def cover_validation
    if !cover_photo.attached?
      errors[:base] << 'Cover Photo cannot be blank'
    end
  end

  def update_featured
    if self.featured == true
      @insider_articles = InsiderArticle.where(featured: true).where.not(id: self.id)
      @insider_articles.update_all(featured: false)
    end
  end
end
