require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  context "as an authenticated user" do
    login_user
    
    let(:current_user) { controller.current_user }

    describe "when POST #create" do 
      let(:valid_params) { attributes_for(:task) }
      
      context "a task on current user task list" do
        let(:task_list) { create(:task_list, user: current_user) }

          it "creates new task in task list" do
            expect {
              xhr :post, :create, task_list_id: task_list, task: valid_params
            }.to change(task_list.tasks, :count).by(1)
          end
        end

      context "a task on another user task list" do
        let(:task_list) { create(:task_list) }

        it "raises an error" do
          expect {
            xhr :post, :create, task_list_id: task_list, task: valid_params
          }.to raise_error "This task list not belongs to you!"
        end
      end
    end

    describe "when PUT #update" do
      context "a task from current user" do 
        let(:task_list) { create(:task_list, user: controller.current_user) }

        it "updates a task" do
          task = create(:task, name: "New Task", task_list: task_list)
          
          expect {
            xhr :put, :update, task_list_id: task_list, id: task, task: {name: "Updated Task"}
          }.to change(Task.where(id: task, name: "Updated Task"), :count).by(1)
        end
      end

      context "a task from another user" do
        let(:task_list) { create(:task_list) }

        it "raises an error" do
          task = create(:task, name: "New Task", task_list: task_list)

          expect {
            xhr :put, :update, task_list_id: task_list, id: task, task: {name: "Updated Task"}
          }.to raise_error "This task list not belongs to you!"
        end
      end
    end

    describe "when DELETE #destroy" do
      context "a task from current user" do
        let(:task_list) { create(:task_list, user: controller.current_user) }
        
        it "removes a task from task list" do
          task = create(:task, task_list: task_list)

          expect {
            xhr :delete, :destroy, task_list_id: task_list, id: task
          }.to change(task_list.tasks, :count).by(-1)
        end
      end

      context "a task from a task list from another user" do 
         let(:task_list) { create(:task_list) } 

         it "raises an error" do
          task = create(:task, task_list: task_list)

          expect {
            xhr :delete, :destroy, task_list_id: task_list, id: task
          }.to raise_error "This task list not belongs to you!"
         end
      end
    end

    describe "when POST #done" do
      let(:task_list) { create(:task_list, user: current_user) }

      it "does a task done by current user" do
        task = create(:task, task_list: task_list)
        expect {
          xhr :post, :done, task_list_id: task_list, id: task
        }.to change(current_user.done_tasks, :count).by(1)
      end
    end

    describe "when POST #done" do
      let(:task_list) { create(:task_list, user: current_user) }

      it "does a task undone by current user" do
        task = create(:task_done_by, user: current_user)
        expect {
          xhr :delete, :undone, task_list_id: task.task_list, id: task
        }.to change(current_user.done_tasks, :count).by(-1)
      end
    end
  end

end
