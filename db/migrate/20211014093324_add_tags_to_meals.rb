class AddTagsToMeals < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :tags, :string
  end
end
