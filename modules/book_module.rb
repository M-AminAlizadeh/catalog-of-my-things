require_relative '../classes/book'
require_relative 'label_module'
require_relative 'genre_module'
require_relative 'author_module'

module BookModule
  include LabelModule

  def create_book
    print 'Published date (yyyy-mm-dd): '
    publish_date = gets.chomp

    print 'Publisher name: '
    publisher = gets.chomp

    print 'Cover state (good/bad): '
    cover_state = gets.chomp
    label = create_label
    genre = creating_genre
    author = add_author

    new_book = Book.new(publish_date, publisher, cover_state)
    new_book.label = label
    new_book.genre = genre
    new_book.author = author

    # Save
    File.open('data/books.json', 'a') do |file|
      file.puts new_book.to_json
    end
    puts 'Book added successfully!'
  end

  def list_of_books
    # Load
    if File.exist?('data/books.json')
      File.open('data/books.json', 'r').each do |line|
        book_data = JSON.parse(line)
        new_book = Book.new(book_data['publish_date'], book_data['publisher'], book_data['cover_state'])
        puts new_book
        puts '-----------------------------------'
      end
    else
      puts 'There is no books yet!'
    end
  end
end
