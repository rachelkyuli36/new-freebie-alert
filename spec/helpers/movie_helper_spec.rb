require 'rails_helper'

describe MoviesHelper do
  describe 'oddness' do
    it 'returns odd when given odd number' do
      odd = MoviesHelper.oddness(3)
      expect(odd).to eql('odd')
    end
  end
end