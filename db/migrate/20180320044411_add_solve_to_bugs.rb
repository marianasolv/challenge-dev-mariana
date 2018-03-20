class AddSolveToBugs < ActiveRecord::Migration[5.0]
  def change
  	add_column :bugs, :solve, :boolean
  end
end
