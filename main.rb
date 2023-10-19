require_relative 'app'

class Main
  def initialize
    @app = App.new
    prompt
  end

  def take_input
    print 'Enter a number: '
    option = gets.chomp.to_i
    while option.nil? || option < 1 || option > 13
      puts 'Please enter a number between 1 and 13!'
      print 'Enter a number: '
      option = gets.chomp.to_i
    end
    option
  end

  def prompt
    puts 'Welcome'
    loop do
      display_options
      option = take_input
      @app.run(option)

      break if option == 13
    end
  end

  def display_options
    puts 'Please choose one of the options: '
    puts '1. - List all books'
    puts '2. - List all music albums'
    puts '3. - List games'
    puts '4. - List all genres'
    puts '5. - List all labels'
    puts '6. - List all authors'
    puts '7. - Create a book'
    puts '8. - Create a music album'
    puts '9. - Create a game'
    puts '10. - Create a genre'
    puts '11. - Create a label'
    puts '12. - Create a author'
    puts '13. - Exit 👋'
  end
end

Main.new
