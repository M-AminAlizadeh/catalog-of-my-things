require_relative '../classes/musicalbum'

module Albummodule
  def initialize(app)
    @app = app
  end

  def list_all_music_albums
    @app.music.each do |album|
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
      puts 'Album cannot be moved to archive.'
    end

    music_album = MusicAlbum.new(publish_date, archived, on_spotify)
    @app.music.push(music_album)
    puts 'Music album created successfully!'
  end

  def save_albums_to_json
    @app.music.map do |album|
      {
        publish_date: album.publish_date,
        archived: album.archived,
        on_spotify: album.on_spotify
      }
    end

    filename = 'music_albums.json'
    File.open(filename, 'w') do |file|
      file.puts(JSON.generate(@music_albums))
    end
  end

  def onloading_albums_data
    file_name = './music_albums.json'
    return unless File.exist?(file_name)

    file = File.read(file_name)
    data_hash = JSON.parse(file)
    data_hash.each do |album|
      album = MusicAlbum.new(@app.music['publish_date'], album['archived'], album['on_spotify'])
      @app.music.push(album)
    end
  end
end
