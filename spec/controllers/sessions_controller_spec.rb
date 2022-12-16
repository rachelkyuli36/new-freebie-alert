require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "login with invalid email/password" do
    it "gives error message" do
      post :create, session: {:email => 'anna123@columbia.edu', :password => 'anna123'}
      expect(flash[:warning]).to match('Invalid email/password combination')
    end
  end

  describe "login with valid and confirmed email/password" do
    it "successfully logs in" do
      User.create(:id => 20, :username => 'anna123', :email => 'anna123@columbia.edu', :password => 'anna123', :email_confirmed => true)
      post :create, session: {:email => 'anna123@columbia.edu', :password => 'anna123'}
      expect(response).to redirect_to events_path
      User.find_by_username('anna123').destroy
    end
  end

  describe "login without confirmed email" do
    it "gives error message" do
      User.create(:id => 20, :username => 'anna123', :email => 'anna123@columbia.edu', :password => 'anna123')
      post :create, session: {:email => 'anna123@columbia.edu', :password => 'anna123'}
      expect(flash[:warning]).to match('Please activate your account by following the instructions in the account confirmation email you received to proceed')
      User.find_by_username('anna123').destroy
    end
  end

end
