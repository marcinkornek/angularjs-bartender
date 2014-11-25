class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :orderable, polymorphic: :true

  validates :orderable_id,    presence: true
  validates :orderable_type,  presence: true

  validates :order,   presence: true
  validates :amount,  presence: true,
                      numericality: { greater_than: 0 }
end
