require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
    
  describe "avatar" do
    let(:avatar_url) { "http://gravatar.com/avatar/999999.png" } 
    let(:user) { double(avatar_url: avatar_url) } 

    it "returns avatar string with user avatar url" do
      expect(helper.avatar(user)).to eq("#{avatar_url}?s=48&d=mm")
    end

    it "returns avatar string with user avatar url and parametized size" do
      expect(helper.avatar(user, 32)).to eq("#{avatar_url}?s=32&d=mm")
    end
  end
  
end
