class AddDefaultsToProject < ActiveRecord::Migration
  def change
    change_column :projects, :week_length, :integer, :default => 5
    change_column :projects, :shift_length, :float, :default => 10
  end
end
