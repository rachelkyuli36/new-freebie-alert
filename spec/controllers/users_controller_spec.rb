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
      expect(flash[:notice]).to match('Please confirm your email address to continue')
      User.find_by(username: 'anna123').destroy
    end
  end

  describe "try to create new user with already existing username" do
    it "should give error message" do
      get :create, {:user => {:id => 20, :username => 'anna123', :email => 'anna123@columbia.edu', :password => 'anna123'}}
      get :create, {:user => {:id => 20, :username => 'anna123', :email => 'anna234@columbia.edu', :password => 'anna123'}}
      expect(response).to redirect_to login_path
      expect(flash[:warning]).to match('Username is already associated with another account. Please try creating another account.')
    end
  end

  describe "try to create new user with already existing email" do
    it "should give error message" do
      get :create, {:user => {:id => 20, :username => 'anna123', :email => 'anna123@columbia.edu', :password => 'anna123'}}
      get :create, {:user => {:id => 20, :username => 'anna234', :email => 'anna123@columbia.edu', :password => 'anna123'}}
      expect(response).to redirect_to login_path
      expect(flash[:warning]).to match('Email is already associated with another account. Please try creating another account.')
    end
  end

  describe "try to create new user with invalid email" do
    it "should give error message" do
      get :create, {:user => {:id => 20, :username => 'anna123', :email => 'anna123@gmail.com', :password => 'anna123'}}
      get :create, {:user => {:id => 20, :username => 'anna234', :email => 'anna123@gmail.com', :password => 'anna123'}}
      expect(response).to redirect_to login_path
      expect(flash[:warning]).to match('Email is not valid. Please try creating another account with a columbia/barnard email.')
    end
  end

  describe "confirm email" do
    it "confirms registered user" do
        User.create(:id => 21, :username => 'anna123', :email => 'anna123@columbia.edu', :password => 'anna123')
        controller.params['email'] = User.find_by_id(21).email
        get :confirm_email, id: 21
        expect(response).to redirect_to login_path
        # expect(flash[:notice]).to match("Welcome to FreebieAlert! Your email has been confirmed. Please sign in to continue.")
     end
  end  

  after (:all) do
    if !User.where(:username => 'anna123').empty?
      User.find_by_username('anna123').destroy
    end
  end

end
