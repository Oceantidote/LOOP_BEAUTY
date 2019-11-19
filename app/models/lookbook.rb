class Lookbook < ApplicationRecord
  include FriendlyId
  include Affiliation
  include Tracked

  friendly_id :title, use: :slugged
  belongs_to :user
  has_one_attached :photo
  has_many :lookbook_products
  has_many :products, through: :lookbook_products
  validates :title, uniqueness: true
  before_save :gen_aff_code

  def approve!
    code = gen_aff_code
    update(status: 'approved', affiliate_code: code, affiliate_link: gen_aff_code(code), publish_date: DateTime.now)
  end

  def reject!
    update(status: 'rejected')
  end

  def submit_for_approval!
    update(status: 'pending')
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
    long_url = lookbook_url(self, aff_code: code)
    if Rails.env.development?
      long_url
    else
      # Keep until we go to the live domain and then switch over to commented section below once live
      long_url.sub!("http://localhost:3000","https://infinite-journey-41892.herokuapp.com")
      # response = RestClient.post("https://api-ssl.bitly.com/v4/bitlinks", {
      #   title: title,
      #   long_url: long_url
      # }.to_json, {'Authorization': "Bearer #{ENV['BITLY_API_KEY']}", 'Content-Type': 'application/json'})
      # JSON.parse(response.body)['link']
    end
  end

end
