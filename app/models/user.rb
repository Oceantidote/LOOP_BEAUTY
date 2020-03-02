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
      unless record.makeup_photo.attached?
        record.errors[:makeup_photo] << 'must be provided'
      end
      if record.description.empty?
        record.errors[:description] << 'must be provided'
      end
      # if record.youtube.empty?
      #   record.errors[:youtube] << 'must be provided'
      # end
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
  validate :terms
  friendly_id :instagram, use: :slugged
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :basket, dependent: :destroy
  has_one_attached :cover_photo
  has_one_attached :avatar_photo
  has_one_attached :qa_photo
  has_one_attached :lookbook_photo
  has_one_attached :tutorial_photo
  has_one_attached :makeup_photo
  has_many :lookbooks, dependent: :destroy
  has_one :question_answer, dependent: :destroy
  has_many :customer_reviews, dependent: :destroy
  has_many :insider_reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :order_products, through: :orders
  has_many :ordered_products, through: :order_products, source: :product
  has_many :shades, through: :order_products
  has_many :tutorials, dependent: :destroy
  has_one :showroom, dependent: :destroy
  has_many :addresses, dependent: :destroy
  # WISHLIST TEST
  has_one :wishlist, dependent: :destroy
  has_many :wishlist_products, through: :wishlist
  # WISHLIST TEST
  before_save :set_referral_code, :check_newsletter
  after_save :create_wishlist
  after_create :send_welcome

  def admin?
    admin
  end

  def influencer?
    influencer
  end

  def age
    now = Date.today
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def sales
    lookbooks.map(&:sales).sum + tutorials.map(&:sales).sum
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def delivery_addresses
    addresses.where(delivery_address: true, deleted: false).order(created_at: :asc)
  end

  def billing_addresses
    addresses.where(delivery_address: false, deleted: false).order(created_at: :asc)
  end

  def remaining_credit
    Money.new remaining_credit_cents
  end

  def remaining_credit_cents
    return 0 unless influencer?
    orders_with_credit_total = Order.where(user: self, created_at: Time.now.beginning_of_month..Time.now).map(&:credit_spent_cents).sum
    10000 - orders_with_credit_total
  end

  private

  def password_complexity
    if password.present? and not password.match(/\S*([A-Z]+\S*(\d|[^\w\s])+|(\d|[^\w\s])+\S*[A-Z]+)\S*/)
      errors.add :password, 'must contain one capital letter and one non-letter character'
    end
  end

  def terms
    if accepts_terms == false
      errors.add :accepts_terms, 'You must accept the Terms & Conditions'
    end
  end

  def set_referral_code
    if referral_code.nil?
      code = "#{first_name.downcase}#{[*0..9].sample(4).join('')}"
      if User.find_by_referral_code(code)
        set_referral_code
      else
        self.referral_code = code
        DiscountCode.create(code: code, discount: 15, uses: 5)
      end
    end
  end

  def check_newsletter
    return unless valid?
    list_id = ENV['MAILCHIMP_LIST_ID']
    gibbon = Gibbon::Request.new(symbolize_keys: true)
    member = gibbon.lists(list_id).members(Digest::MD5.hexdigest(email))
    begin
      status = member.retrieve.body[:status]
      if status == 'subscribed' && !newsletter
        newsletter_unsubscribe(gibbon, list_id)
      elsif status == 'unsubscribed' && newsletter
        newsletter_resubscribe(gibbon, list_id)
      end
    rescue Gibbon::MailChimpError => e
      newsletter_subscribe(gibbon, list_id) if e.body[:status] == 404 && newsletter
    end
  end

  def newsletter_subscribe(client, id)
    begin
      client.lists(id).members.create({
        body: {
          email_address: email,
          status: 'subscribed',
          merge_fields: {
            FNAME: first_name,
            LNAME: last_name
          }
        }
      })
    rescue Gibbon::MailChimpError
      return 'There was a problem subscribing you to the mailing list'
    end
  end

  def create_wishlist
    if self.influencer
      Showroom.create(user: self)
    end
    Wishlist.create(user: self)
  end

  def newsletter_unsubscribe(client, id)
    begin
      client.lists(id).members(Digest::MD5.hexdigest(email)).update(body: {status: "unsubscribed"})
    rescue Gibbon::MailChimpError
      flash[:notice] = 'There was a problem subscribing you to the mailing list'
    end
  end

  def newsletter_resubscribe(client, id)
    begin
      client.lists(id).members(Digest::MD5.hexdigest(email)).update(body: {status: "subscribed"})
    rescue Gibbon::MailChimpError
      flash[:notice] = 'There was a problem subscribing you to the mailing list'
    end
  end

  def send_welcome
    article = InsiderArticle.where(featured: true).first.id
    tutorial = Tutorial.where(featured: true).first.id
    if influencer?
      UserMailer.with(user: self.id).welcome_influencer.deliver_now
    else
      UserMailer.with(user: self.id, article: article, tutorial: tutorial).welcome.deliver_now
    end
  end
end
