class RemoveOwnerFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :owner, :string
  end
end
