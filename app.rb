require_relative 'modules/game_module'
require_relative 'modules/author_module'
require_relative 'modules/preserve_data'

class App
  include GameModule
  include AuthorModule
  include PreserveData
  attr_accessor :item, :books, :music, :games, :authors

  def initialize
    @books = []
    @music = []
    @authors = []
    @games = []

    load_files_data
  end

  def list_all_books; end

  def list_all_music_albums; end

  def list_all_games
    list_games
  end

  def list_all_music_genres; end

  def list_all_labels; end

  def list_authors
    list_present_authors
  end

  def add_book
    # add a label
  end

  def add_music_album
    # add a music genre
  end

  def add_game
    # add an author
    create_game
  end
end
