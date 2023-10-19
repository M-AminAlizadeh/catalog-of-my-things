require 'json'
require_relative 'modules/book_module'

class App
  include BookModule
  attr_accessor :item, :books, :music, :games

  def initialize
    @books = []
    @music = []
    @games = []
  end

  def list_all_books
    list_of_books
  end

  def list_all_music_albums; end

  def list_all_games; end

  def list_all_music_genres; end

  def list_all_labels
    list_of_labels
  end

  def list_authors; end

  def add_book
    create_book
  end

  def add_music_album
    # add a music genre
  end

  def add_game
    # add an author
  end
end
