require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before (:all) do
    if User.where(:username => 'anna123').empty?
        User.create(:username => 'anna123', :email => 'anna123@columbia.edu', :password => 'anna123')
    end
    if Event.where(:title => 'WiCS Tabling').empty?
        Event.create(:title => 'WiCS Tabling', :freebie => 'FOOD', :event_date => '2022-09-07', :event_time => '10:00-11:00AM', :affiliation => 'WiCS')
    end
  end

  describe "create new user" do
    it "should create a new" do
      get :create, {:user => {:id => 20, :username => 'anna123', :email => 'anna123@columbia.edu', :password => 'anna123'}}
      expect(response).to redirect_to events_path
      User.find_by_id(20).destroy
    end
  end

  # describe "GET #create" do
  #   it "returns http success" do
  #     get :create
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
