require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

    before (:all) do
        if Event.where(:title => 'Frich Giveaway').empty?
            Event.create(:id => 31, :title => 'Frich Giveaway', :freebie => 'FOOD', :event_date => '2022-12-02', :event_time => '9:00AM-5:00PM', :affiliation => 'Frich')
        end
        if User.where(:username => 'anna123').empty?
            User.create(:id =>25, :username => 'anna123', :email => 'anna123@columbia.edu', :password => 'anna123')
        end
    end

    describe 'write new comment' do
        it 'should update comment' do
            # Comment.create(:name => 'anna', :comment => 'so excited!', :event_id => 31)
            # c = Comment.find_by(:name => 'anna', :event_id => 31)
            get :create, event_id: 31, comment: {:name => 'anna', :comment => 'so excited!', :event_id => 31} #params: {:comment => c, :name => 'anna', :event_id => 31}
            expect(response).to redirect_to event_path(:id => 31)
        end
    end

    describe 'delete comment' do
        it 'should destroy' do
            Comment.create(:name => 'anna', :comment => 'so excited!', :event_id => 31)
            get :destroy, event_id: 31, id: Comment.find_by(:name => 'anna', :event_id => 31).id
            expect(response).to redirect_to event_path(:id => 31)
        end
    end

    after (:all) do
        if !Event.where(:title => 'Frich Giveaway').empty?
            Event.find_by_title('Frich Giveaway').destroy
        end
        if !User.where(:username => 'anna123').empty?
            User.find_by_username('anna123').destroy
        end
    end
end
