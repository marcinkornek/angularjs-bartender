class Order < ActiveRecord::Base
  has_many :order_details
  belongs_to :bartender, class_name: 'User'
end
