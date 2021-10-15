class Group < ApplicationRecord
  has_many :meals
  has_many :users
end
