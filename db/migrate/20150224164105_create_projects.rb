class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :shift_length
      t.integer :week_length

      t.timestamps
    end
  end
end
