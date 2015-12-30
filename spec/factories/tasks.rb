FactoryGirl.define do
  
  factory :task do
    name "New Task"
    task_list

    factory :task_done_by do
      transient do
        user
      end

      after :create do |task, evaluator| 
        create(:user_done_task, user: evaluator.user, task: task)
      end
    end
  end

end
