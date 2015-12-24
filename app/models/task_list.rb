class TaskList < ActiveRecord::Base
  belongs_to :user
  has_many :user_favorite_task_lists
  has_many :favorited_by, through: :user_favorite_task_lists, source: :user

  validates :user, presence: true

  scope :publics, -> { where(public: true) }
end
