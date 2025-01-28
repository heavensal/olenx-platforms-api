class AddReferencesToIdeas < ActiveRecord::Migration[8.0]
  def change
    add_reference :ideas, :user, null: false, foreign_key: true
  end
end
