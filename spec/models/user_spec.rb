require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many :task_lists }
  it { is_expected.to have_many :favorite_task_lists }

  let(:user) { create(:user) }

  describe "#favorite_task_lists" do

    context "favorites a task list" do
      it "adds a task list to the favorite task lists" do
        task_list = create(:task_list)

        user.favorites task_list
        
        expect(user.favorite_task_lists).to include(task_list)
      end
    end

    context "unfavorites a task list" do
      it "removes a task list from favorite task lists" do
        task_list = create(:task_list_favorited_by, user: user)

        user.unfavorites task_list
        
        expect(user.favorite_task_lists).to_not include(task_list)
      end
    end

  end
  
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
