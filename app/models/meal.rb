class Meal < ApplicationRecord
  belongs_to :group
  has_many :comments, dependent: :destroy
  has_many :meal_tag_joins
  has_many :tags, through: :meal_tag_joins

  validates :title, presence: true, length: {maximum: 25, minimum: 3}
  validates :recipe, length: {maximum: 300}
  validate :expiration_date
  validates :due_date, presence: true

  def expiration_date
    if !(due_date.future?)
      errors.add(:due_date, "The selected time has already passed!")
    end
    end
end
