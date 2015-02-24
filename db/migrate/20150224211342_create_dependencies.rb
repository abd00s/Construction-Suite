class CreateDependencies < ActiveRecord::Migration
  def change
    create_table :dependencies do |t|
      t.integer :activity_id
      t.integer :dependent_id

      t.timestamps
    end
  end
end
