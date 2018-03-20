class RemoveSolveFromBugs < ActiveRecord::Migration[5.0]
  def change
  	remove_column :bugs, :solve
  end
end
