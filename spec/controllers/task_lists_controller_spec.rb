require 'rails_helper'

RSpec.describe TaskListsController, type: :controller do
  
  let(:valid_attributes) { attributes_for(:task_list) }
  let(:task_list) { create(:task_list) }

  context "as an authenticated user" do
    login_user
    
    let(:current_user) { controller.current_user }

    describe "when POST #create" do
      context "with valid attributes" do
        
        let(:create_task_list) { post :create, task_list: valid_attributes }
        
        it "creates a new task list" do           
          expect { 
            create_task_list
          }.to change(TaskList, :count).by(1) 
        end

        it "redirects to the new task list" do
          create_task_list
          expect(response).to redirect_to profile_path(current_user)
        end

        it "associates new task list with current user" do
          create_task_list
          expect(current_user.task_lists).to include(TaskList.last)
        end
      end 
    end

    describe "when DELETE #destroy" do
      before { @task_list = task_list }
      
      it "deletes the task list" do
        expect {
          delete :destroy, id: @task_list
        }.to change(TaskList, :count).by(-1)
      end

    end

    describe "when POST #favorite" do

      it "add current user as favorite" do
        expect {
          post :favorite, id: task_list
        }.to change(task_list.favorited_by, :count).by(1)

        expect(task_list.favorited_by).to include(current_user)
      end

    end

    describe "when DELETE #unfavorite" do

      it "remove current user as favorite" do
        task_list = create(:task_list_favorited_by, user: current_user)
        
        expect {
          delete :unfavorite, id: task_list
        }.to change(task_list.favorited_by, :count).by(-1)

        expect(task_list.favorited_by).to_not include(current_user)
      end

    end

  end
end
