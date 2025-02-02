class AddPortfolioReferencesToProjects < ActiveRecord::Migration[8.0]
  def change
    add_reference :projects, :portfolio, null: false, foreign_key: true
  end
end
