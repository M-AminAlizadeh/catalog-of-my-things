require_relative '../classes/genre'
require_relative '../app'
require 'json'

module GenreList
  def initialize(app)
    @app = app
  end

  def creating_genre
    puts "\nAdd the name of genre"
    genre_name = gets.chomp

    if @app.genres.any? { |genre| genre.name == genre_name }
      puts 'Genre already exists!'
    else
      genre = Genre.new(genre_name)
      @app.genre.push(genre)
      puts 'Genre created successfully!'
    end
  end

  def list_genres
    if @app.genres.empty?
      puts 'There are no genres added to the list.'
    else
      @app.genres.each do |genre|
        puts "[#{genre.class.name}], Name of genre: #{genre.name}"
      end
    end
  end

  def save_genre_to_json
    @app.genres.map do |genre|
      {
        name: genre.name
      }
    end

    filename = 'genres.json'
    File.open(filename, 'w') do |file|
      file.puts(JSON.generate(@genres))
    end
  end

  def onloading_genres_data
    file_name = './genres.json'
    return unless File.exist?(file_name)

    file = File.read(file_name)
    data_hash = JSON.parse(file)
    data_hash.each do |genre|
      genre = Genre.new(genre['name'])
      @app.genres.push(genre)
    end
  end
end
