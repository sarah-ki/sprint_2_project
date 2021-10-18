class AddGroupToUserGroupsJoin < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_groups_joins, :group, null: false, foreign_key: true
  end
end
