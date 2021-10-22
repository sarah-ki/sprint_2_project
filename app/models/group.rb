class Group < ApplicationRecord
  has_many :meals, dependent: :destroy
  has_many :user_groups_joins, dependent: :destroy
  has_many :users, through: :user_groups_joins

end
