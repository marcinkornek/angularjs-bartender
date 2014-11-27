class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :product, presence: true
  validates :order,   presence: true
  validates :amount,  presence: true,
                      numericality: { greater_than: 0 }
end
