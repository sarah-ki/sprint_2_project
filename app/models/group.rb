class Group < ApplicationRecord
  has_many :meals, dependent: :destroy
  has_many :user_groups_joins, dependent: :destroy
  has_many :users, through: :user_groups_joins

  validates :users, presence: true
  validates :name, presence: true
  validates_length_of :name, maximum: 20, minimum: 3, message: "Your Groups name should have at least 3 characters but not more than 20"
  validates_uniqueness_of :name, message: "this name already exists!"
  validates :description, length: {maximum: 300}


end
