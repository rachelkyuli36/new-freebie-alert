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

  describe "welcome the user" do
    it "should show user page" do
      user = User.find_by(username: 'anna123')
      user.should respond_to(:welcome)
      expect(user).to receive(:welcome).and_return('Hi, anna123! Welcome to FreebieAlert!')
      # get :create, {:user => {:id => 20, :username => 'anna123', :email => 'anna123@columbia.edu', :password => 'anna123'}}
      # user = User.find_by(username: 'anna123')
      # expect(user).to receive(:welcome).and_return('Hi, anna123! Welcome to FreebieAlert')
    end
  end
end
