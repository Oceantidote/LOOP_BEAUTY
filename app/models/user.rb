class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.influencer?
      unless record.cover_photo.attached?
        record.errors[:cover_photo] << 'must be provided'
      end
      unless record.lookbook_photo.attached?
        record.errors[:lookbook_photo] << 'must be provided'
      end
      unless record.qa_photo.attached?
        record.errors[:qa_photo] << 'must be provided'
      end
      unless record.avatar_photo.attached?
        record.errors[:avatar_photo] << 'must be provided'
      end
      unless record.tutorial_photo.attached?
        record.errors[:tutorial_photo] << 'must be provided'
      end
      if record.description.empty?
        record.errors[:description] << 'must be provided'
      end
      if record.youtube.empty?
        record.errors[:youtube] << 'must be provided'
      end
      if record.instagram.empty?
        record.errors[:instagram] << 'must be provided'
      end
    end
  end
end



class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include ActiveModel::Validations
  validates_with MyValidator
  include FriendlyId
  validates :first_name, :last_name, presence: true
  friendly_id :instagram, use: :slugged
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :basket
  has_one_attached :cover_photo
  has_one_attached :avatar_photo
  has_one_attached :qa_photo
  has_one_attached :lookbook_photo
  has_one_attached :tutorial_photo
  has_many :products, through: :order_products, as: :ordered_products
  has_many :lookbooks
  has_many :insider_articles
  has_one :question_answer
  has_many :customer_reviews
  has_many :insider_reviews
  has_many :orders
  has_many :shades, through: :order_products
  has_many :tutorials
  has_one :showroom
  # WISHLIST TEST
  has_one :wishlist
  has_many :wishlist_products, through: :wishlist
  # WISHLIST TEST

  def admin?
    admin
  end

  def influencer?
    influencer
  end

  def sales
    lookbooks.map(&:sales).sum + tutorials.map(&:sales).sum
  end

  def full_name
    "#{first_name} #{last_name}"
  end






end
