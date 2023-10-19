require 'json'
require_relative 'modules/genre_module'
require_relative 'modules/musicalbum_module'
require_relative 'classes/musicalbum'
require_relative 'modules/book_module'
require_relative 'modules/game_module'
require_relative 'modules/author_module'
# require_relative 'modules/preserve_data'

class App
  include GenreList
  include Albumlogic
  include BookModule
  include GameModule
  include AuthorModule
  # include PreserveData
  attr_accessor :item, :books, :music, :games, :genres, :authors

  def list_all_books
    list_of_books
  end

  def list_all_music_albums
    list_music_albums
  end

  def list_all_games
    list_games
  end

  def list_all_genres
    list_genres
  end

  def list_all_labels
    list_of_labels
  end

  def list_authors
    list_present_authors
  end

  def add_book
    create_book
  end

  def add_music_album
    create_music_album
  end

  def add_game
    create_game
  end
end
