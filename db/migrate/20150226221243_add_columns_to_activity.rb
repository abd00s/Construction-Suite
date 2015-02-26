class AddColumnsToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :duration, :float
    add_column :activities, :early_start, :float
    add_column :activities, :early_finish, :float
    add_column :activities, :late_start, :float
    add_column :activities, :late_finish, :float
    add_column :activities, :free_float, :float
    add_column :activities, :total_float, :float
  end
end
