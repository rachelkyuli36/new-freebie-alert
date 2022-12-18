require 'rails_helper'

describe EventsController, :type => :controller do
    before (:all) do
        if Event.where(:title => 'Frich Giveaway').empty?
            Event.create(:title => 'Frich Giveaway', :freebie => 'FOOD', :event_date => '2022-12-02', :event_time => '9:00AM-5:00PM', :affiliation => 'Frich')
        end
        if Event.where(:title => 'WiCS Tabling').empty?
            Event.create(:id => 21, :title => 'WiCS Tabling', :freebie => 'FOOD', :event_date => '2022-09-07', :event_time => '10:00-11:00AM', :affiliation => 'WiCS')
        end
    end

    describe 'get upcoming' do 
      it 'should find no upcoming_events' do 
        expect Event.upcoming(Event.where(:title => 'WiCS Tabling')).nil?
      end
    end

    describe 'get past' do 
      it 'should find a past event' do 
        expect !Event.past(Event.where(:title => 'WiCS Tabling')).empty?
      end
    end

    describe 'see all events' do
        it 'should show the homepage' do
            get :index#, params: {"freebies"=>{"FOOD"=>"1", "MERCH"=>"1", "OTHER"=>"1"}, "sort_by"=>"id"}
            # expect(response).to redirect_to events_path
            # expect(response).to render_template("index")
            # expect(response).to redirect_to("http://test.host/events?freebies%5BFOOD%5D=1&freebies%5BMERCH%5D=1&freebies%5BOTHER%5D=1&sort_by=id")
            # expect(response).to redirect_to %r(http:\/\/test.host\/events.)
        end
    end

    describe 'edit event' do
        it 'should show edit page' do
            get :edit, id: 21
            expect(response).to render_template("edit")
        end
    end

    describe 'create new event' do
        it 'should create a new event' do
          get :create, {:event => {:id => 13, :title => 'Pepper Spray on Low', :freebie => 'OTHER', :event_date => '2022-11-17', :event_time => '12:00-2:00PM'}}
          expect(response).to redirect_to events_path
          expect(flash[:notice]).to match(/Pepper Spray on Low was successfully created./)
          Event.find_by_title('Pepper Spray on Low').destroy
        end
    end

    describe 'destroying an event' do
        it 'redirects to home page after event is destroyed' do
            Event.create(:id => 12, :title => 'Stickers in Mudd', :freebie => 'OTHER', :event_date => '2022-09-20')
            get :show, {:id => 12}
            get :destroy, {:id => 12}
            expect(response).to redirect_to('/events')
        end
    end

    describe 'updating an event' do
        it 'redirects to home page after movie is updated' do
            Event.create(:id => 12, :title => 'Stickers in Mudd', :freebie => 'OTHER', :event_date => '2022-09-20')
            get :update, id: 12, event:{'title' => 'Stickers at Mudd'}
            expect(response).to redirect_to('/events/12')
            expect(Event.find_by(id: 12).title).to eq('Stickers at Mudd')
        end
    end

    describe 'share an event' do
        it 'redirects to share page' do
            get :share, :id => 21
            expect(response).to render_template("share")
        end
    end

    after (:all) do
        if !Event.where(:title => 'Frich Giveaway').empty?
            Event.find_by_title('Frich Giveaway').destroy
        end
        if !Event.where(:title => 'WiCS Tabling').empty?
            Event.find_by_title('WiCS Tabling').destroy
        end
    end
end

        