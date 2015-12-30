require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to belong_to(:task_list) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_one(:user) }

  describe "#done_by?" do
    let(:user) { create(:user) }
    
    context "when not done by user" do
      it { is_expected.to_not be_done_by user }
    end

    context "when done by user" do
      subject { create(:task_done_by, user: user) }
      it { is_expected.to be_done_by user }
    end
  end
end
