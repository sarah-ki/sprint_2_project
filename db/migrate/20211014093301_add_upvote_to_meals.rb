class AddUpvoteToMeals < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :upvotes, :integer
  end
end
