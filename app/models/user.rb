class User < ActiveRecord::Base
  extend FriendlyId
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  friendly_id :name, use: :slugged

  has_many :task_lists
  has_many :user_favorite_task_lists
  has_many :favorite_task_lists, through: :user_favorite_task_lists, source: :task_list

  has_many :user_done_tasks
  has_many :done_tasks, through: :user_done_tasks, source: :task

  validates_presence_of :name, :slug
  validates_uniqueness_of :slug

  def public_task_lists
    task_lists.publics
  end

  def favorites task_list
    self.user_favorite_task_lists.create(task_list_id: task_list.id)
  end

  def unfavorites task_list
    self.user_favorite_task_lists.find_by(task_list_id: task_list.id).destroy
  end

  def avatar_url
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def completes task
    self.user_done_tasks.create(task_id: task.id)
  end

  def uncompletes task
    self.user_done_tasks.find_by(task_id: task.id).destroy
  end
end
