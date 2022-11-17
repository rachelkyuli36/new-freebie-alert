require 'rails_helper'

RSpec.describe LikesController, type: :controller do
    before (:all) do
        if Event.where(:title => 'Giveaway').empty?
            Event.create(:title => 'Giveaway', :freebie => 'FOOD', :event_date => '2022-12-02', :event_time => '9:00AM-5:00PM', :affiliation => 'Frich')
        end
        if User.where(:username => 'yslee').empty?
            User.create(:username => 'yslee', :email => 'yslee@columbia.edu', :password => 'yslee')
        end
    end
    describe 'like an event' do
        it 'adds to like count' do
            Like.create(:user => User.find_by_username('yslee'), :event => Event.find_by_title('Giveaway'))
            expect((Event.find_by_title('Giveaway')).likes.count).to eq(1)
        end
    end
end
