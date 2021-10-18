class Group < ApplicationRecord
  has_many :meals
  has_many :user_groups_joins
  has_many :users, through: :user_groups_joins

end
