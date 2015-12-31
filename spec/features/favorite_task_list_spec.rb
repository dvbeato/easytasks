RSpec.feature 'Favorite Task List' do

  given!(:user) { create(:user) }
  
  background do 
    sign_in user.email, user.password
  end  
  
  context "given another user with a public task list" do
    given!(:another_user) { create(:user_with_public_task_list) }

    scenario "allows user favorite his task list", js: true do
      visit profile_path another_user

      find('.unfavorite').click
      
      expect(page).to have_selector('.favorite')
    end
  end

  context "given another user with a task list favorited by user" do
    
    given!(:another_user) do 
      another_user = create(:user_with_public_task_list) 
      user.favorites another_user.public_task_lists.first
      another_user
    end    
    
    scenario "allows user to unfavorite his task list", js: true do
      visit profile_path another_user

      find('.favorite').click
      
      expect(page).to have_selector('.unfavorite')
    end
  end
end
