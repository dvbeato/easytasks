class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :done
      t.references :task_list, index: true

      t.timestamps
    end
  end
end
