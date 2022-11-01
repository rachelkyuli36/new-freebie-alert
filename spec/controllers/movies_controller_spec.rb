require 'rails_helper'

describe MoviesController do
  before(:all) do
    if Movie.where(:director => 'Christopher Nolan').empty?
      Movie.create(:title => 'Interstellar', :director => 'Christopher Nolan', :rating => 'PG-13', :release_date => '2014-10-24')
      Movie.create(:title => 'Inception', :director => 'Christopher Nolan', :rating => 'PG-13', :release_date => '2010-07-13')
    end
    if Movie.where(:title => 'Dune').empty?
      Movie.create(:title => 'Dune', :rating => 'PG-13', :release_date => '2021-10-22')
    end
  end

  describe 'search for other movies by the same director' do
    it 'should return similar movies if a director exists' do
      expect(Movie).to receive(:similar_movies).with('Interstellar')
      get :search, {title: 'Interstellar'}
    end
  
    it 'should redirect to home page if no director info is available' do
      get :search, {title: 'Dune'}
      expect(response).to redirect_to(root_url)
    end
  end

  describe 'create new movie' do
    it 'should create a new movie' do
      get :create, {:movie => {:title => 'The Imitation Game', :director => 'Morten Tyldum', :rating => 'PG-13', :release_date => '2014-09-28'}}
      expect(response).to redirect_to movies_path
      expect(flash[:notice]).to match(/The Imitation Game was successfully created./)
      Movie.find_by_title('The Imitation Game').destroy
    end
  end

  describe 'update an existing movie' do
    it 'should update the movie attributes' do
      m = Movie.create(:title => 'The Imitation Game', :director => 'Morten Tyldum', :rating => 'PG-13', :release_date => '2014-09-28')
      get :update, {:id => m.id, :movie => {:description => 'WWII story of Alan Turing'}}
      expect(response).to redirect_to movie_path(m)
      expect(flash[:notice]).to match(/The Imitation Game was successfully updated./)
      m.destroy
    end
  end

  describe 'deleting existing movie' do
    it 'should delete movie from database' do
      m = Movie.create(:title => 'The Imitation Game', :director => 'Morten Tyldum', :rating => 'PG-13', :release_date => '2014-09-28')
      count = Movie.count
      get :destroy, {:id => m.id}
      expect(Movie.count).to eql(count-1)
      expect(response).to redirect_to(movies_path)
    end
  end
end