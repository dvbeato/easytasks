require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  let(:user) { create(:user) }

  context "as an authenticated user" do
    login_user
    describe "GET #show" do
      it "returns http success" do
        get :show, id: user
        expect(response).to have_http_status(:success)
      end

      it "assigns user requested to @user" do
        get :show, id: user
        expect(assigns(:user)).to eq(user)
      end
    end
  end

end
