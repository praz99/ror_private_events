require "rails_helper"
require 'support/authentication_helper'


RSpec.describe UsersController, type: :controller do
  describe "SHOW page" do
    it 'can be reached successfully' do
      # test_user = User.create(username: "kikiolla", name: "kiki")
      # visit user_path(test_user)

      # expect(page.status_code).to eq(200)
    end
  end

  describe "CREATE users" do
    subject { post :create, params: { user: { name: 'name', username: 'username' } } }
    
    it 'redirects to the action show' do
      expect(subject).to redirect_to(assigns(:user))
  
    end

    it 'successfully creates a new user' do
      expect { 
        post :create, params: { :user => { :username => "kikiolla", :name => "kiki"} }
      }.to change(User, :count).by(1)
    end
  end
end
