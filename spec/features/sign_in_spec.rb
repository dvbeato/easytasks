RSpec.feature 'User Log in' do

  given!(:user) { create(:user) }

  context "with valid email and password" do
    scenario "redirects to home page" do
      sign_in user.email, user.password

      expect(current_path).to eq(root_path)
    end
  end

  context "with invalid email and password" do
    scenario "redirects to login page" do
      sign_in "invalid_user", "invalid_password"
    
      expect(current_path).to eq(new_user_session_path)
    end
  end

end
