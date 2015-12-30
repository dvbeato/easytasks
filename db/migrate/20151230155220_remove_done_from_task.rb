class RemoveDoneFromTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :done, :boolean
  end
end
