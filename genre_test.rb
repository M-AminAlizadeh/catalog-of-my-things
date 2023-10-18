require 'rspec'
require_relative 'genre'
require_relative 'item'

describe Genre do
  before(:each) { @genre = Genre.new(88, 'Heavy metal') }

  context 'attributes' do
    it 'has a name' do
      expect(@genre.name).to eq('Heavy metal')
    end

    it 'has items' do
      expect(@genre.items).to eq([])
    end
  end

  context 'methods' do
    it 'adds item to the array of items' do
      item = Item.new('2023-10-17')
      expect(item).to receive(:genre=).with(@genre)
      @genre.add_item(item)
    end

    it 'adds self in the array of items' do
      item = Item.new('2023-10-17')
      @genre.add_item(item)
      expect(@genre.items).to include(item)
    end

    it 'can add items' do
      item = Item.new('2023-10-17')
      @genre.add_item(item)
      expect(@genre.items).to eq([item])
    end
  end
end

# to pass the test in the item.rb class to add
#   attr_accessor :genre
