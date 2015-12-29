require 'rails_helper'

RSpec.describe TaskList, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to have_many(:favorited_by) }
  it { is_expected.to have_many(:tasks) }
  it { is_expected.to_not be_public }
  it { is_expected.to validate_presence_of(:name) }

  
  describe "#favorited_by" do
    it "contains user how favorite" do 
      user = create(:user)
      
      task_list = create(:task_list_favorited_by, user: user)

      expect(task_list.favorited_by).to include(user)
    end
  end

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
