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
  validate :password_complexity
  friendly_id :instagram, use: :slugged
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :basket, dependent: :destroy
  has_one_attached :cover_photo
  has_one_attached :avatar_photo
  has_one_attached :qa_photo
  has_one_attached :lookbook_photo
  has_one_attached :tutorial_photo
  has_many :products, through: :order_products, as: :ordered_products
  has_many :lookbooks, dependent: :destroy
  has_many :insider_articles, dependent: :destroy
  has_one :question_answer, dependent: :destroy
  has_many :customer_reviews, dependent: :destroy
  has_many :insider_reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shades, through: :order_products
  has_many :tutorials, dependent: :destroy
  has_one :showroom, dependent: :destroy
  has_many :addresses
  # WISHLIST TEST
  has_one :wishlist, dependent: :destroy
  has_many :wishlist_products, through: :wishlist
  # WISHLIST TEST
  before_save :set_referral_code, :check_newsletter

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

  def delivery_addresses
    addresses.where(delivery_address: true)
  end

  def billing_addresses
    addresses.where(delivery_address: false)
  end

  private

  def password_complexity
    if password.present? and not password.match(/\S*([A-Z]+\S*(\d|[^\w\s])+|(\d|[^\w\s])+\S*[A-Z]+)\S*/)
      errors.add :password, 'must contain one capital letter and one non-letter character'
    end
  end

  def set_referral_code
    if referral_code.nil?
      code = "#{first_name}#{[*0..9].sample(4).join('')}"
      if User.find_by_referral_code(code)
        set_referral_code
      else
        self.referral_code = code
        DiscountCode.create(code: code, discount: 15)
      end
    end
  end

  def check_newsletter
    return
    # list_id = "I need a list id"
    # gibbon = Gibbon::Request.new
    # results = gibbon.lists(list_id).members.retrieve(params: {email: email})
    # # Need to check what results actually comes back as
    # if newsletter && results.length < 1
    #   newsletter_subscribe(gibbon, list_id)
    # elsif newsletter && results.length >= 1
    #   newsletter_resubscribe(gibbon, list_id)
    # elsif !newsletter && results.length >= 1
    #   newsletter_unsubscribe(gibbon, list_id)
    # end
  end

  def newsletter_subscribe(client, id)
    begin
      client.lists(id).members.create({
        body: {
          email: email,
          status: 'subscribed',
          merge_fields: {
            FNAME: first_name,
            LNAME: last_name
          }
        }
      })
    rescue Gibbon::MailChimpError => e
      puts "HEEEEEEEEEEEEEEEEEEEEEEEEELP!!!!!"
    end
  end

  def newsletter_unsubscribe(client, id)
    begin
      client.lists(id).members(Digest::MD5.hexdigest(email)).update(body: {status: "unsubscribed"})
    rescue Gibbon::MailChimpError => e
      puts "HEEEEEEEEEEEEEEEEEEEEEEEEELP!!!!!"
    end
  end

  def newsletter_resubscribe(client, id)
    begin
      client.lists(id).members(Digest::MD5.hexdigest(email)).update(body: {status: "subscribed"})
    rescue Gibbon::MailChimpError => e
      puts "HEEEEEEEEEEEEEEEEEEEEEEEEELP!!!!!"
    end
  end
end
