class Comment < ApplicationRecord
  belongs_to :meal

  validates :name, presence: true
  validates :body, presence: true, length: {minimum: 3, maximum: 300}
  validates :meal_id, presence: true


end
