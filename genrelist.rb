class GenreList
  def initialize
    @genres = []
  end

  def creating_genre
    puts 'Add the name of music genre'
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @genres.push(genre)
    puts 'Genre created successfully!'
  end

  def list_all_genres
    @genres.each do |genre|
      puts "Id: \"#{genre.id}\", Name of genre: #{genre.name}"
    end
  end
end
