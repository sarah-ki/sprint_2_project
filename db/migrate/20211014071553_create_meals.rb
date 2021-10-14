class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.string :title
      t.text :recipe
      t.string :user
      t.date :created
      t.datetime :due_date
      t.string :group
      t.integer :upvotes
      t.string :tags

      t.timestamps
    end
  end
end
