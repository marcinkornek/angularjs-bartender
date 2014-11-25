class Order < ActiveRecord::Base
  has_many :order_details
  belongs_to :bartender, class_name: 'User'

  def set_total_price
    self.total_price = order_details.map(&:price).reduce(:+).to_f
    self.save
  end

  validates :bartender, presence: true

end
