class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :ingredient
      t.float :amount
      t.string :person

      t.timestamps
    end
  end
end
