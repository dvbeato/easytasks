class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :task_lists
  has_many :user_favorite_task_lists
  has_many :favorite_task_lists, through: :user_favorite_task_lists, source: :task_list

  def public_task_lists
    task_lists.publics
  end

  def favorites task_list
    self.user_favorite_task_lists.create(task_list_id: task_list.id)
  end

  def unfavorites task_list
    self.user_favorite_task_lists.find_by(task_list_id: task_list.id).destroy
  end

end
