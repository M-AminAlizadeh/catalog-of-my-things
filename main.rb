require './app'

class Main
  def initialize
    @app = App.new
  end

  def list_items_choice(choice)
    case choice
    when 1 then @app.list_all_books
    when 2 then @app.list_all_music_albums
    when 3 then @app.list_all_games
    when 4 then @app.list_all_genres
    when 5 then @app.list_all_labels
    when 6 then @app.list_authors
    end
  end

  def add_items_choice(choice)
    case choice
    when 7 then @app.add_book
    when 8 then @app.add_music_album
    when 9 then @app.add_game
    end
  end

  def run
    puts "\nCatalog of my things\n"
    loop do
      print_user_options
      choice = gets.chomp.to_i
      break if choice == 10

      case choice
      when 1..6
        list_items_choice(choice)
      when 7..9
        add_items_choice(choice)
      else
        puts 'Error: Invalid number.'
      end
    end
  end

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
