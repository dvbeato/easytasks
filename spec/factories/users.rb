FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"

    factory :user_with_public_task_list do 
      after :create do |user|
        user.task_lists << create(:public_task_list)
      end
    end
  end
end
