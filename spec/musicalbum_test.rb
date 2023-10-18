require 'rspec'
require_relative '../musicalbum'
require_relative '../genre'
require_relative '../classes/item'

describe MusicAlbum do
  before(:each) do
    @genre = Genre.new('Heavy metal')
    @item = Item.new('2023-10-17')
    @genre.add_item(@item)
    @music = MusicAlbum.new('2000-12-12', false)
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

    it 'can be archived should return true if item class method returns true AND if on_spotify equals to true' do
      expect(@music.can_be_archived?).to eq(false)
    end

    it 'can be moved to archive' do
      @music.move_to_archive
      expect(@music.archived).to eq(false)
    end
  end
end

# To pass the test in the music album class to add the following
# return false unless super(@publish_date)
