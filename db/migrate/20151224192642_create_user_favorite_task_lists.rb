class CreateUserFavoriteTaskLists < ActiveRecord::Migration
  def change
    create_table :user_favorite_task_lists do |t|
      t.integer :task_list_id
      t.integer :user_id

      t.timestamps
    end
  end
end
