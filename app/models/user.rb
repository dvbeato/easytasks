class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :task_lists
  has_many :user_favorite_task_lists
  has_many :favorite_task_lists, through: :user_favorite_task_lists, source: :task_list

  def publics_task_lists
    task_lists.publics
  end

  def favorites task_list
    self.favorite_task_lists << task_list
  end

  def unfavorites task_list
    self.favorite_task_lists.delete task_list
  end

end
