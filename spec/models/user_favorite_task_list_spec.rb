require 'rails_helper'

RSpec.describe UserFavoriteTaskList, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:task_list) }
end
