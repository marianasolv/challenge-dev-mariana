class ChangeSolveTypeInBugs < ActiveRecord::Migration[5.0]
  def change
  	change_column :bugs, :solve, :boolean
  end
end
