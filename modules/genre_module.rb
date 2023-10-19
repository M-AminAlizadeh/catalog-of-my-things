require_relative '../classes/genre'
require_relative '../app'
require 'json'

module GenreList
  def creating_genre(genres)
    puts "\nAdd the name of genre"
    genre_name = gets.chomp

    if genres.any? { |genre| genre.name == genre_name }
    else
      genre = Genre.new(genre_name)
      genres.push(genre)
    end
  end

  def list_genres(genres)
    # puts 'Choose which genres you would like to list'
    # puts '1. Book genres'
    # puts '2. Music genres'
    # puts '3. Game genres'

    # choice = gets.chomp.to_i

    # case choice
    # when 1 then
    if genres.empty?
      puts 'There are no genres added to the list.'
    else
      genres.each do |genre|
        puts "[], ID: #{genre.id}, Name of genre: #{genre.name}"
      end
    end
  end

  def save_genre_to_json(genres)
    genres = genres.map do |genre|
      {
        name: genre.name,
        id: genre.id
      }
    end

    filename = 'genres.json'
    File.open(filename, 'w') do |file|
      file.puts(JSON.generate(genres))
    end
  end

  def onload_genre_data(genres)
    filename = 'genres.json'

    return unless File.exist?(filename)

    file = File.read(filename)
    file_data = JSON.parse(file)
    file_data.each do |item|
      genres.push(Genre.new(
                    item['name']
                  ))
    end
  end
end
