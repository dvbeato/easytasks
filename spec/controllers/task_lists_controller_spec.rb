require 'rails_helper'

RSpec.describe TaskListsController, type: :controller do
  
  let(:valid_attributes) { attributes_for(:task_list) }
  let(:task_list) { create(:task_list) }

  context "as an authenticated user" do
    login_user

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
          expect(response).to redirect_to TaskList.last
        end

        it "associates new task list with current user" do
          create_task_list
          expect(controller.current_user.task_lists).to include(TaskList.last)
        end
      end 
    end

    describe "when GET #show/:id" do
      it "assigns the requested task list to @task_list" do
        get :show, id: task_list
        expect(assigns(:task_list)).to eq(task_list)
      end

      it "renders the #show template" do
        get :show, id: task_list
        expect(response).to render_template :show
      end
    end

    describe "when DELETE #destroy" do
      before do
        @task_list = create(:task_list)
      end

      it "deletes the task list" do
        expect {
          delete :destroy, id: @task_list
        }.to change(TaskList, :count).by(-1)
      end

    end
  end
end
