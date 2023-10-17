require 'rspec'
require_relative 'musicalbum'

describe MusicAlbum do
  music = MusicAlbum.new('1991-02-04', true, on_spotify: false)

  context 'attributes' do
    it 'has publish_date' do
      expect(music.publish_date).to eq('1991-02-04')
    end

    it 'is not on Spotify by default' do
      expect(music.on_spotify).to be(false)
    end

    it 'should be archived by default' do
      expect(music.archived).to be(true)
    end
  end
end
