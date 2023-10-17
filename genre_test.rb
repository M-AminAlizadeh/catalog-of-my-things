require 'rspec'
require_relative 'genre'

describe Genre do
  genre = Genre.new(269, 'Thriller')

  context 'attributes' do
    it 'has an id' do
      expect(genre.id).to equal(269)
    end

    it 'has a name' do
      expect(genre.name).to eq('Thriller')
    end
  end
end
