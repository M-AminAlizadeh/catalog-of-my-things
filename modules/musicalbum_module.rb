require_relative '../classes/musicalbum'
require_relative 'genre_module'
require 'json'
require 'pry'

module Albumlogic
  include GenreList

  def list_music_albums
    music.each do |album|
      on_spotify = album.on_spotify ? 'true' : 'false'
      puts "Published: \"#{album.publish_date}\", Archived: #{album.archived}, On Spotify: #{on_spotify}"
    end
  end

  def create_music_album
    puts 'Is the album on Spotify? [Y/N]?'
    on_spotify = gets.chomp.downcase == 'y'

    puts 'Please enter the date of publish [YYYY-MM-DD]'
    publish_date = gets.chomp

    if MusicAlbum.can_be_archived?(publish_date)
      puts 'Would you like to archive it [Y/N]?'
      archive_response = gets.chomp.downcase
      archived = archive_response == 'y'

      if archived
        puts 'Album moved to archive.'
      else
        puts 'Album not archived.'
      end
    else
      archived = false
      puts 'Album cannot be moved to archive.'
    end

    creating_genre(genres)
    # create author
    # creat label

    music_album = MusicAlbum.new(publish_date, archived, on_spotify: on_spotify)
    music.push(music_album)
    puts 'Music album created successfully!'
  end

  def save_album_data_to_json(music)
    music = music.map do |album|
      {
        publish_date: album.publish_date,
        archived: album.archived,
        on_spotify: album.on_spotify
      }
    end

    filename = 'data/music_albums.json'
    File.open(filename, 'w') do |file|
      file.puts(JSON.generate(music))
    end
  end

  def onload_album_data(music)
    filename = 'data/music_albums.json'

    return unless File.exist?(filename)

    file = File.read(filename)
    file_data = JSON.parse(file)
    file_data.each do |item|
      music.push(MusicAlbum.new(
                   item['publish_date'],
                   item['archived'],
                   item['on_spotify']
                 ))
    end
  end
end
