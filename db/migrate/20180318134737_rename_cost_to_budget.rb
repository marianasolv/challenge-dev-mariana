class RenameCostToBudget < ActiveRecord::Migration[5.0]
  def change
  	rename_column :projects, :cost, :budget
  end
end
