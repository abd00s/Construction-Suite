class ChangeColumnNameInDep < ActiveRecord::Migration
  def change
    rename_column :dependencies, :dependent_id, :predecessor_id
  end
end
