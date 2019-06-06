class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include FriendlyId
  friendly_id :instagram, use: :slugged
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :basket
  has_one_attached :photo
  has_many :products, through: :order_products, as: :ordered_products
  has_many :lookbooks
  has_many :insider_articles
  has_many :question_answers
  has_many :customer_reviews
  has_many :insider_reviews
  has_many :orders
  has_many :shades, through: :order_products
  has_many :tutorials
  has_one :showroom

  def admin?
    admin
  end
end
