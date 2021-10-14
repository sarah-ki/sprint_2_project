class AddGroupToMeals < ActiveRecord::Migration[6.1]
  def change
    add_reference :meals, :group, null: false, foreign_key: true
  end
end
