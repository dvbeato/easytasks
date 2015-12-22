require 'rails_helper'

RSpec.describe TaskList, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user) }

  describe ".publics" do
    
    subject(:publics_task_lists) { TaskList.publics }

    before do
      @private_task_list = create(:task_list)
      @public_task_list_one = create(:public_task_list)
      @public_task_list_two = create(:public_task_list)
    end

    it { is_expected.to contain_exactly(@public_task_list_one, @public_task_list_two) }
    it { is_expected.to_not include(@private_task_list) }
    
  end

end
