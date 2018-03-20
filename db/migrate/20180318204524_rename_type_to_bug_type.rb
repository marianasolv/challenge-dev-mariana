class RenameTypeToBugType < ActiveRecord::Migration[5.0]
  def change
  	rename_column :bugs, :type, :bug_type
  end
end
