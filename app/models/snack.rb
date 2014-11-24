class Snack < ActiveRecord::Base
  belongs_to :category
  has_many :order_details, as: :orderable
end
