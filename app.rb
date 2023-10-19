require_relative 'modules/genre_module'
require_relative 'modules/musicalbum_module'
require_relative 'classes/musicalbum'

class App
  attr_accessor :item, :books, :music, :games, :genres

  include GenreList
  include Albumlogic

  def initialize
    @books = []
    @music = []
    @games = []
    @genres = []
    @music = []
  end

  def list_all_books; end

  def list_all_music_albums
    list_music_albums
  end

  def list_all_games; end

  def list_all_genres
    list_genres
  end

  def list_all_labels; end

  def list_authors; end

  def add_book
    # add a label
  end

  def add_music_album
    create_music_album
  end

  def add_game
    # add an author
  end
end
