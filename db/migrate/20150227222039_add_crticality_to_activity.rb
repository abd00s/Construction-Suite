class AddCrticalityToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :is_critical, :boolean
  end
end
