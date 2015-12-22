class TaskList < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true

  scope :publics, -> { where(public: true) }

end
