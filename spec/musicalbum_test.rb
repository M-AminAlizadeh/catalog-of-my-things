require 'rspec'
require_relative '../classes/musicalbum'
require_relative '../classes/genre'
require_relative '../classes/item'

describe MusicAlbum do
  before(:each) do
    @genre = Genre.new('Heavy metal')
    @item = Item.new('2023-10-17')
    @genre.add_item(@item)
    @music = MusicAlbum.new('2000-12-12', false, false)
  end

  context 'attributes' do
    it 'has publish_date' do
      expect(@music.publish_date).to eq('2000-12-12')
    end

    it 'archive boolean default set to false' do
      expect(@music.archived).to be(false)
    end

    it 'is should not be on Spotify' do
      expect(@music.on_spotify).to be(false)
    end
  end
end
