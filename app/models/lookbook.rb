class Lookbook < ApplicationRecord
  include FriendlyId
  include Affiliation
  include Tracked

  friendly_id :title, use: :slugged
  belongs_to :user
  has_one_attached :photo
  has_many :lookbook_products, dependent: :destroy
  has_many :products, through: :lookbook_products
  validates :title, uniqueness: true
  before_save :gen_aff_code
  after_create :send_for_approval

  def approve!
    code = gen_aff_code
    update(status: 'approved', affiliate_code: code, affiliate_link: gen_aff_link(code), publish_date: DateTime.now)
    UserMailer.with(content: self, user: self.user).content_approval.deliver_now
  end

  def reject!
    update(status: 'rejected')
    UserMailer.with(content: self, user: self.user).content_approval.deliver_now
  end

  def submit_for_approval!
    self.status == 'rejected' ? rejected = true : rejected = false
    update(status: 'pending')
    UserMailer.with(content: self, influencer: self.user, rejected: rejected).new_content.deliver_now
  end

  def send_for_approval
    UserMailer.with(content: self, influencer: self.user).new_content.deliver_now
  end

  def sales
    orders.size
  end

  def self.filter_sort(attr, direction)
    order(attr => direction.to_sym)
  end

  def sales_total
    Money.new sales_total_cents
  end

  def sales_total_cents
    orders.sum(&:total_price_cents)
  end

  def record_current_visits
    MonthlyVisit.create(month: Date.today.beginning_of_month, visits: visits, tracked: self)
  end

  def visits_this_period(period)
    visits - monthly_visits.where(created_at: period).order(:created_at).first.visits
  end

  def self.total_visits_this_period(lookbooks, period)
    total_visits = lookbooks.sum(:visits)
    total_visits_at_start_of_period = lookbooks.map { |l| l.monthly_visits.where(month: period).minimum(:visits) || 0 }.sum
    total_visits - total_visits_at_start_of_period
  end

  private

  def gen_aff_code
    code = [*(0..9), *('a'..'z'), *('A'..'Z')].sample(8).join
    if Lookbook.find_by_affiliate_code(code) || Tutorial.find_by_affiliate_code(code)
      gen_aff_code
    else
      code
    end
  end

  def gen_aff_link(code)
    if Rails.env.development?
      long_url = Rails.application.routes.url_helpers.lookbook_url(self, aff_code: code)
      long_url
    else
      "https://infinite-journey-41892.herokuapp.com/lookbooks/#{self.slug}?aff_code=#{code}"
      # Keep until we go to the live domain and then switch over to commented section below once live
      # long_url = Rails.application.routes.url_helpers.lookbook_url(self, aff_code: code)
      # response = RestClient.post("https://api-ssl.bitly.com/v4/bitlinks", {
      #   title: title,
      #   long_url: long_url
      # }.to_json, {'Authorization': "Bearer #{ENV['BITLY_API_KEY']}", 'Content-Type': 'application/json'})
      # JSON.parse(response.body)['link']
    end
  end

end
