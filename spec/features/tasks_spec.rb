RSpec.feature 'Tasks' do
  given!(:user) { create(:user) }

  background do 
    sign_in user.email, user.password
  end  

  context "given a task list", js: true do

    given!(:task_list) { create(:task_list, user: user) }

    scenario "allows user to add tasks" do 
      visit profile_path user
      click_link task_list.name

      fill_in "task_name", with: "New Task"

      first('.new-task').click
      
      expect(page).to have_field('task_name', with: '')
      expect(find('.tasks li')).to have_content("New Task") 
    end
  end
end
