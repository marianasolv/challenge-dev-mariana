class CreateBugs < ActiveRecord::Migration[5.0]
  def change
    create_table :bugs do |t|
      t.string :name
      t.string :type
      t.text :description
      t.binary :solve

      t.timestamps
    end
  end
end
