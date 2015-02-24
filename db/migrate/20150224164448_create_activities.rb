class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.float :amount
      t.float :rate
      t.integer :crew_size
      t.integer :morning_crews
      t.integer :evening_crews
      t.integer :project_id

      t.timestamps
    end
  end
end
