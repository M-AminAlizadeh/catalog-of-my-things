require 'json'
require_relative 'modules/book_module'
require_relative 'modules/label_module'

class App
  include BookModule
  include LabelModule

  def run(option)
    case option
    when 1
      list_of_books
    when 2
      list_of_music_album
    when 3
      list_of_games
    when 4
      list_of_genres
    when 5
      list_of_labels
    when 6
      list_of_authors
    when 7
      create_book
    when 8
      create_music_album
    when 9
      create_game
    when 10
      create_genre
    when 11
      create_label
    when 12
      create_author
    else
      puts 'Thanks for using this app'
      exit
    end
  end
end
