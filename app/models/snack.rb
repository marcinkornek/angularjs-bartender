class Snack < ActiveRecord::Base
  belongs_to :category
  has_many :order_details, as: :orderable

  validates :name,  presence: true
  validates :size,  presence: true
  validates :price, presence: true,
                    numericality: { greater_than: 0 }
end
