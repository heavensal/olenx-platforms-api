class DestroyJwtDenyListsTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :jwt_deny_lists
  end
end
