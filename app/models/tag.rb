class Tag < ApplicationRecord
  has_many :meal_tag_joins
  has_many :meals, through: :meal_tag_joins
  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
end
