require 'rspec'
require_relative 'genre'

describe Genre do
  genre = Genre.new(2, 'Thriller')

  context 'attributes' do
    it 'has an id' do
      expect(genre.id).to equal(2)
    end
  end
end
