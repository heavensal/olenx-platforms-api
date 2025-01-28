class CreateQrCodes < ActiveRecord::Migration[8.0]
  def change
    create_table :qr_codes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :portfolio, null: false, foreign_key: true
      t.text :svg, null: false
      t.integer :views, default: 0, null: false
      t.timestamps
    end
  end
end
