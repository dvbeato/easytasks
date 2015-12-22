require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many :task_lists }

  
  describe "#publics_task_lists" do
    
    subject(:user_publics_task_lists) { @user.publics_task_lists }

    before do
      @user = create(:user)
      @another_user = create(:user)
      
      @private_list = create(:task_list, user: @user)
      
      @public_list_one   = create(:public_task_list, user: @user)
      @public_list_two   = create(:public_task_list, user: @user)
      @public_list_three = create(:public_task_list, user: @another_user)
    end

    it { is_expected.to contain_exactly(@public_list_one, @public_list_two) }
    it { is_expected.to_not include(@public_list_three) }

  end

end
