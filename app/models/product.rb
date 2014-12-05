class Product < ActiveRecord::Base
  has_many :order_details,   dependent: :destroy
  has_many :product_details, dependent: :destroy

  CATEGORIES = %w(food drinks alcohol snacks)
  KINDS = %w(milliliters grams size)

  validates :size_type,   inclusion: { in: KINDS }
  validates :category,    inclusion: { in: CATEGORIES }
  validates :name,        presence: true

  before_save { name.capitalize! }
  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :product_details, :reject_if => :reject_tour, allow_destroy: true

  scope :food, -> { where('category = ?', 'food') }
  scope :drinks, -> { where('category = ?', 'drinks') }
  scope :snacks, -> { where('category = ?', 'snacks') }
  scope :alcohol, -> { where('category = ?', 'alcohol') }

  def self.search(query)
    where("name ilike ?", "%#{query}%")
  end

  def reject_tour(attributes)
    exists = attributes['id'].present?
    empty = attributes[:when].blank? || attributes[:where].blank?
    attributes.merge!({_destroy: 1}) if exists and empty
    return (!exists and empty)
  end

end
