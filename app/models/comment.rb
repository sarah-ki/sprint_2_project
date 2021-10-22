class Comment < ApplicationRecord
  belongs_to :meal
  validates :name, presence: true
  validates :body, presence: true
end
