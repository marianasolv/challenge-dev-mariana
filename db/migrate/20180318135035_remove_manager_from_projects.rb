class RemoveManagerFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :manager, :string
  end
end
