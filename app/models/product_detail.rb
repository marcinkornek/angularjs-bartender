class ProductDetail < ActiveRecord::Base
  belongs_to :product

  validates :size,  presence: true
  validates :price, presence: true,
                    numericality: { greater_than: 0 }
end
