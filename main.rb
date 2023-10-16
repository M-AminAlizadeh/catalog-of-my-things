require './app'

class Main
    def initialize
      @app = App.new
    end
  
    def run
      puts "\nCatalog of my things\n"

        loop do
            print_user_options
            choice = gets.chomp.to_i
            case choice
            when 1 then @app.list_all_books
            when 2 then @app.list_all_music_albums
            when 3 then @app.list_all_movies
            when 4 then @app.list_all_music_genres
            when 5 then @app.list_all_labels
            when 6 then @app.list_authors
            when 7 then @app.add_book
            when 8 then @app.add_music_album
            when 9 then @app.add_movie
            when 10 
                puts 'Exiting the app! Goodbye.'
                break
            else
                puts 'Error: Invalid number.'
            end
        end
    end
  # rubocop:enable Metrics/CyclomaticComplexity
  
  def print_user_options
      puts "\nPlease choose an option by entering a number:\n" \
           "1. List all books\n" \
           "2. List all music albums\n" \
       "3. List all games" \
       "4. List all music genres\n" \
           "5. List all labels\n" \
           "6. List all authors\n" \
           "7. Add a book\n" \
           "8. Add a music album\n" \
           "9. Add a Game\n" \
       "10. Exit\n\n"
  end
end

Main.new.run
