require_relative '../classes/genre'
require_relative '../app'
require 'json'

module GenreList
  def creating_genre
    puts "\nAdd the name of genre"
    genre_name = gets.chomp
    genre = Genre.new(genre_name)

    File.open('data/genres.json', 'a') do |file|
      file.puts genre.to_json
    end

    puts '-----------------------------------'
    puts 'successfully ADDED!!'
    puts '-----------------------------------'
    genre
  end

  def list_genres
    puts 'Listing Genres present'
    if File.exist?('data/genres.json')
      File.open('data/genres.json', 'r').each do |line|
        genre_data = JSON.parse(line)
        new_genre = Genre.new(genre_data['name'])
        puts "ID: #{new_genre.id}, Name of genre: #{new_genre.name}"

        puts '-----------------------------------'
      end
    else
      puts 'No genres file found!'
    end
  end
end
