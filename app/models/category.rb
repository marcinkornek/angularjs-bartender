class Category < ActiveRecord::Base
  has_many :food
  has_many :drinks
  has_many :snacks
end
