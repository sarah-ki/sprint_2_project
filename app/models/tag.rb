class Tag < ApplicationRecord
  has_many :meal_tag_joins
  has_many :meals, through: :meal_tag_joins
end
