class DiscountCode < ApplicationRecord
  has_many :orders
  has_many :baskets
  has_one :freebie, dependent: :destroy
  before_create :gen_code, if: :no_code?

  def no_code?
    code.nil?
  end
  
  def gen_code
    arr = [*('0'..'9').to_a,*('a'..'z').to_a,*('A'..'Z').to_a]
    gen_code = ''
    8.times do
      gen_code += arr.sample 
    end
    if DiscountCode.find_by_code(gen_code).nil?
      self[:code] = gen_code
    else
      gen_code
    end
  end
end
