class AddDefaultsToActivity < ActiveRecord::Migration
  def change
    change_column :activities, :morning_crews, :integer, :default => 1
    change_column :activities, :evening_crews, :integer, :default => 0
  end
end
