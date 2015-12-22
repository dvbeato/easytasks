FactoryGirl.define do
  
  factory :task_list do
    name "My New Task List"
    public false
    user
    
    trait :public do
      public true
    end

    factory :public_task_list, traits: [:public] 

  end

end
