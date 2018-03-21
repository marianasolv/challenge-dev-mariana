class CreateBugs < ActiveRecord::Migration[5.0]
  def change
    create_table :bugs do |t|
      t.string :name
      t.string :bug_type
      t.text :description
      t.boolean :solve

      t.timestamps
    end
  end
end