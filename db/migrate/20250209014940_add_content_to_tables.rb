class AddContentToTables < ActiveRecord::Migration[8.0]
  def change
    add_column :ideas, :content, :text
    add_column :projects, :content, :text
  end
end
