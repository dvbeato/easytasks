require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to belong_to(:task_list) }
end
