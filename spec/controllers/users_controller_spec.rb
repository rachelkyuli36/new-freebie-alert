require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  # before (:all) do
  #   if User.where(:username => 'anna123').empty?
  #       User.create(:username => 'anna123', :email => 'anna123@columbia.edu', :password => 'anna123')
  #   end
  # end

  describe "create new user" do
    it "should create a new" do
      get :create, {:user => {:id => 20, :username => 'anna123', :email => 'anna123@columbia.edu', :password => 'anna123'}}
      expect(response).to redirect_to login_path
      expect(flash[:notice]).to match('Login with your new account!')
      User.find_by(username: 'anna123').destroy
    end
  end

  describe "try to create new user with already existing username" do
    it "should give error message" do
      get :create, {:user => {:id => 20, :username => 'anna123', :email => 'anna123@columbia.edu', :password => 'anna123'}}
      get :create, {:user => {:id => 20, :username => 'anna123', :email => 'anna234@columbia.edu', :password => 'anna123'}}
      expect(response).to redirect_to login_path
      expect(flash[:warning]).to match('Username is already associated with another account. Please try creating another account.')
      User.find_by(username: 'anna123').destroy
    end
  end

  describe "try to create new user with already existing email" do
    it "should give error message" do
      get :create, {:user => {:id => 20, :username => 'anna123', :email => 'anna123@columbia.edu', :password => 'anna123'}}
      get :create, {:user => {:id => 20, :username => 'anna234', :email => 'anna123@columbia.edu', :password => 'anna123'}}
      expect(response).to redirect_to login_path
      expect(flash[:warning]).to match('Email is already associated with another account. Please try creating another account.')
      User.find_by(username: 'anna123').destroy
    end
  end

end
