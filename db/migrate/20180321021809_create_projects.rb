class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.decimal :budget
      t.date :start_date

      t.timestamps
    end
  end
end