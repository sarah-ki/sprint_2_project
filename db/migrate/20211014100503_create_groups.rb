class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :members
      t.string :name
      t.text :description
      t.string :pw

      t.timestamps
    end
  end
end
