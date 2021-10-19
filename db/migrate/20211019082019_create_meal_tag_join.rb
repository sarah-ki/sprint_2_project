class CreateMealTagJoin < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_tag_joins do |t|
      t.belongs_to :meals
      t.belongs_to :tags
    end
  end
end
