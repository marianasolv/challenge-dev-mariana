class AddProjectToBugs < ActiveRecord::Migration[5.0]
  def change
  	add_reference :bugs, :project, foreign_key: true
  end
end