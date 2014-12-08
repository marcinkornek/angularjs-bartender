class Product < ActiveRecord::Base
  has_many :order_details,   dependent: :destroy
  has_many :product_details, dependent: :destroy

  CATEGORIES = %w(food drinks alcohol snacks)
  KINDS = %w(milliliters grams size)

  validates :size_type,   inclusion: { in: KINDS }
  validates :category,    inclusion: { in: CATEGORIES }
  validates :name,        presence: true
  validates :image,       presence: true

  before_save { name.capitalize! }
  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :product_details

  scope :food, -> { where('category = ?', 'food') }
  scope :drinks, -> { where('category = ?', 'drinks') }
  scope :snacks, -> { where('category = ?', 'snacks') }
  scope :alcohol, -> { where('category = ?', 'alcohol') }

  def self.search(query)
    where("name ilike ?", "%#{query}%")
  end

  def delete_nested_attr(product_details_ids_new)
    product_details_ids_old = product_details.map(&:id)
    ids =  product_details_ids_old - product_details_ids_new
    ids.each do |id|
      product_details.find(id).destroy
    end
  end

end
