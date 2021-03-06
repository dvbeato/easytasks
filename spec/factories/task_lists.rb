FactoryGirl.define do
  
  factory :task_list do
    name "My New Task List"
    public false
    user
    
    trait :public do
      public true
    end

    factory :public_task_list, traits: [:public] 

    factory :task_list_favorited_by do
      after :create do |task_list, evaluator|
        task_list.user_favorite_task_lists.create(user_id: evaluator.user.id)
      end
    end
  end

end
