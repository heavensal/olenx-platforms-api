class CreateReactions < ActiveRecord::Migration[8.0]
  def change
    create_table :reactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :idea, null: false, foreign_key: true
      t.string :reaction_type, null: false, default: "like"
      # combo -> unique combination of user_id and idea_id and like
      t.index [ :user_id, :idea_id ], unique: true


      t.timestamps
    end
  end
end
