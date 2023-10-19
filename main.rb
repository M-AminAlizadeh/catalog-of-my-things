require './app'
require_relative 'modules/musicalbum_module'

class Main

  include Albumlogic

  def initialize
    @app = App.new
  end
  # rubocop:disable Metrics/CyclomaticComplexity

  def run
    puts "\nCatalog of my things\n"
    @app.onload_album_data(@app.music)
    loop do
      print_user_options
      choice = gets.chomp.to_i
      break if choice == 10

      case choice
      when 1 then @app.list_all_books
      when 2 then @app.list_all_music_albums
      when 3 then @app.list_all_movies
      when 4 then @app.list_all_genres
      when 5 then @app.list_all_labels
      when 6 then @app.list_authors
      when 7 then @app.add_book
      when 8 then @app.add_music_album
      when 9 then @app.add_movie
      else
        puts 'Error: Invalid number.'
      end
    end
    @app.save_album_data_to_json(@app.music)
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def print_user_options
    print "\nPlease choose an option by entering a number:\n"
    print "1. List all books\n"
    print "2. List all music albums\n"
    print "3. List all games\n"
    print "4. List all genres\n"
    print "5. List all labels\n"
    print "6. List all authors\n"
    print "7. Add a book\n"
    print "8. Add a music album\n"
    print "9. Add a Game\n"
    print "10. Exit\n\n"
  end
end

Main.new.run
