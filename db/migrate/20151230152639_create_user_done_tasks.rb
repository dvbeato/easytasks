class CreateUserDoneTasks < ActiveRecord::Migration
  def change
    create_table :user_done_tasks do |t|
      t.references :user, index: true
      t.references :task, index: true

      t.timestamps
    end
  end
end
