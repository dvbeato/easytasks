require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to belong_to(:task_list) }
  it { is_expected.to_not be_done }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_one(:user) }
end
