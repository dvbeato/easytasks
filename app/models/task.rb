class Task < ActiveRecord::Base
  belongs_to :task_list
  has_one :user, through: :task_list
  validates :name, presence: true
end
