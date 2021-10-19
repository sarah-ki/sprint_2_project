class Meal < ApplicationRecord
  belongs_to :group
  has_many :comments, dependent: :destroy

  has_many :meal_tag_joins
  has_many :tags, through: :meal_tag_joins
end
