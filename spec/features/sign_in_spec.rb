RSpec.feature 'User Log in' do

  given!(:user) { create(:user) }

  scenario 'with valid email and password' do
    sign_in user.email, user.password

    expect(current_path).to eq(root_path)
  end

  scenario 'with invalid email and password' do
    sign_in "invalid_user", "invalid_password"
  
    expect(current_path).to eq(new_user_session_path)
  end

end
