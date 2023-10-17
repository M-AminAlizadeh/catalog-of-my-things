require 'rspec'
require_relative 'genre'

describe Genre do
  context 'attributes' do
    it 'has an id' do
      genre = Genre.new(269, 'Thriller')
      expect(genre.id).to equal(269)
    end

    it 'has a name' do
      genre = Genre.new(269, 'Thriller')
      expect(genre.name).to eq('Thriller')
    end
  end

  context 'methods' do
    it 'adds item to the array of items' do
      genre = Genre.new(269, 'Thriller')
      item = double('item')
      expect(item).to receive(:genre=).with(genre)
      genre.add_item(item)
    end

    it 'adds self in the array of items' do
      genre = Genre.new(269, 'Thriller')
      item = double('item')
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end
