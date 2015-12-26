require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  context "as an authenticated user" do
    login_user
    
    let(:current_user) { controller.current_user }

    let(:valid_params) { attributes_for(:task) }

    let(:task_list) { create(:task_list) }

    describe "when POST #create" do 
      context "with valid params" do
        it "creates new task in task list" do
          expect {
            xhr :post, :create, task_list_id: task_list, task: valid_params
          }.to change(task_list.tasks, :count).by(1)
        end
      end
    end

    describe "when DELETE #destroy" do
      it "removes a task from task list" do
        task = create(:task, task_list: task_list)
        expect {
          xhr :delete, :destroy, task_list_id: task_list, id: task
        }.to change(task_list.tasks, :count).by(-1)
      end
    end

  end

end