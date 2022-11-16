require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before (:all) do
    if User.where(:username => 'anna123').empty?
        User.create(:username => 'anna123', :email => 'anna123@columbia.edu', :password => 'anna123')
    end
  end

  describe "create new user" do
    it "should create a new" do
      get :create, {:user => {:id => 20, :username => 'anna123', :email => 'anna123@columbia.edu', :password => 'anna123'}}
      expect(response).to redirect_to events_path
      User.find_by(username: 'anna123').destroy
    end
  end

  # describe "delete user" do
  #   it "should delete the user" do
  #     get :create, {:user => {:id => 20, :username => 'anna123', :email => 'anna123@columbia.edu', :password => 'anna123'}}
  #     User.find_by(username: 'anna123').destroy
  #     expect(response).to redirect_to login_path
  #     expect(flash[:notice]).to match('Account anna123 deleted')
  #   end
  # end


  # describe "GET #create" do
  #   it "returns http success" do
  #     get :create
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
