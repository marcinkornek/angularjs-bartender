class Product < ActiveRecord::Base
  has_many :order_details

  CATEGORIES = %w(food drinks snacks)
  KINDS = %w(milliliters grams size)

  validates :category,  inclusion: { in: CATEGORIES }
  validates :product_type,  inclusion: { in: KINDS }
  validates :name,  presence: true
  validates :size,  presence: true
  validates :price, presence: true,
                    numericality: { greater_than: 0 }

  before_save { name.capitalize! }

  mount_uploader :image, ImageUploader

  scope :food, -> { where('category = ?', 'food') }
  scope :drinks, -> { where('category = ?', 'drinks') }
  scope :snacks, -> { where('category = ?', 'snacks') }

  def self.search(query)
    where("name ilike ?", "%#{query}%")
  end

end
