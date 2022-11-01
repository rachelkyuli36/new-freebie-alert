require 'rails_helper'

describe Movie do
  before(:all) do
    if Movie.where(:director => 'Christopher Nolan').empty?
      Movie.create(:title => 'Interstellar', :director => 'Christopher Nolan', :rating => 'PG-13', :release_date => '2014-10-24')
      Movie.create(:title => 'Inception', :director => 'Christopher Nolan', :rating => 'PG-13', :release_date => '2010-07-13')
    end
    if Movie.where(:title => 'Dune').empty?
      Movie.create(:title => 'Dune', :director => 'Denis Villeneuve', :rating => 'PG-13', :release_date => '2021-10-22')
    end
  end

  describe 'similar_movies method' do
    it 'returns other movies by the same director' do
      movie_name = Movie.find_by_title('Interstellar')
      other_movies = Movie.similar_movies(movie_name)
      expect(other_movies.length()). to eq(1)
      expect(other_movies).to include(Movie.find_by_title('Inception'))
    end

    it 'does not return movies by different directors' do
      movie_name = Movie.find_by_title('Dune')
      other_movies = Movie.similar_movies(movie_name)
      expect(other_movies).to be_empty
    end
  end
end

