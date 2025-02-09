class AddAvatarToTables < ActiveRecord::Migration[8.0]
  def change
    add_column :portfolios, :avatar, :string
    add_column :ideas, :avatar, :string
    add_column :projects, :avatar, :string
  end
end
