require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many :task_lists }
  it { is_expected.to have_many :favorite_task_lists }
  it { is_expected.to have_many :done_tasks }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:slug) }

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
  
  describe "#public_task_lists" do
    
    before do
      @private_list    = create(:task_list, user: user)
      @public_list_one = create(:public_task_list, user: user)
      @public_list_two = create(:public_task_list, user: user)
      
      another_user = create(:user)
      @public_list_three = create(:public_task_list, user: another_user)
    end

    it "returns only public task lists from user" do 
      expect(user.public_task_lists).to contain_exactly(@public_list_one, @public_list_two)
    end  

    it "not returns public task lists from another user" do  
      expect(user.public_task_lists).to_not include(@public_list_three)
    end

  end

  describe "#avatar_url" do
    it "returns gravatar url" do 
      expect(user.avatar_url).to match(/http:\/\/gravatar.com\/avatar\/[\w]*?.png/)
    end
  end

  describe "#done_tasks" do
    let(:task) { create(:task_done_by, user: user) } 
    
    it "returns taks done by user" do
      expect(user.done_tasks).to contain_exactly(task)
    end

  end

  describe "#completes" do 

    it "completes a task" do
      task = create(:task) 
      user.completes task
      expect(user.done_tasks).to include(task)
    end
  end

  describe "#uncompletes" do 

    it "uncompletes a task" do
      task = create(:task_done_by, user: user) 
      user.uncompletes task
      expect(user.done_tasks).to_not include(task)
    end
  end

end
