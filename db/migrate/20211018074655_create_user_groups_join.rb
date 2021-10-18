class CreateUserGroupsJoin < ActiveRecord::Migration[6.1]
  def change
    create_table :user_groups_joins do |t|
      t.belongs_to :groups
      t.belongs_to :users
    end
  end
end
