require 'json'
require_relative 'modules/genre_module'
require_relative 'modules/musicalbum_module'
require_relative 'classes/musicalbum'
require_relative 'modules/book_module'

class App
  include GenreList
  include Albumlogic
  include BookModule
  attr_accessor :item, :books, :music, :games, :genres

  def initialize
    @books = []
    @music = []
    @games = []
    @genres = []
  end

  def list_all_books
    list_of_books
  end

  def list_all_music_albums
    list_music_albums
  end

  def list_all_games; end

  def list_all_genres
    list_genres(genres)
  end

  def list_all_labels
    list_of_labels
  end

  def list_authors; end

  def add_book
    create_book
  end

  def add_music_album
    create_music_album
  end

  def add_game
    # add an author
  end
end
