require_relative 'musicalbum'

class MusicList
  def initialize
    @music_albums = []
  end

  def list_all_music_albums
    @music_albums.each do |album|
      puts "Published: \"#{album.publish_date}\", Archived: #{album.archived}, On Spotify: #{album.on_spotify}"
    end
  end

  def add_music_album
    puts 'Is the album on Spotify? [Y/N]?'
    on_spotify = gets.chomp.downcase == 'y'

    puts 'Please enter the date of publish [YYYY-MM-DD]'
    publish_date = gets.chomp

    if move_to_archive
      archived = true
      puts 'Album moved to archive.'
    else
      archived = false
    end

    music_album = MusicAlbum.new(publish_date, archived, on_spotify)
    @music_album.push(music_album)
    puts 'Music album created successfully!'
  end
end
