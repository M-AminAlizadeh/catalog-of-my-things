require_relative '../classes/musicalbum'
require_relative 'genre_module'
require_relative 'label_module'
require_relative 'author_module'
require 'json'
require 'pry'

module Albumlogic
  include GenreList

  def list_music_albums
    if File.exist?('data/music_albums.json')
      File.open('data/music_albums.json', 'r').each do |line|
        music_album_data = JSON.parse(line)
        new_album = MusicAlbum.new(music_album_data['publish_date'], music_album_data['archived'],
                                   music_album_data['on_spotify'])
        puts "Published: \"#{new_album.publish_date}\", Archived: #{new_album.archived}, On Spotify: #{new_album.on_spotify}"
        puts '-----------------------------------'
      end
    else
      puts 'There is no music albums yet!'
    end
  end

  def create_music_album
    puts 'Is the album on Spotify? [Y/N]?'
    on_spotify = gets.chomp.downcase == 'y'

    puts 'Please enter the date of publish [YYYY-MM-DD]'
    publish_date = gets.chomp

    if MusicAlbum.can_be_archived?(publish_date, on_spotify)
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
    label = create_label
    genre = creating_genre
    author = add_author

    music_album = MusicAlbum.new(publish_date, archived, on_spotify: on_spotify)
    music_album.label = label
    music_album.genre = genre
    music_album.author = author

    File.open('data/music_albums.json', 'a') do |file|
      file.puts music_album.to_json
    end
    puts 'Music album created successfully!'
  end
end
