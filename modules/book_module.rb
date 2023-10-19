require_relative '../classes/book'

module BookModule
  def create_book
    print 'Published date (yyyy-mm-dd): '
    publish_date = gets.chomp

    print 'Publisher name: '
    publisher = gets.chomp

    print 'Cover state (good/bad): '
    cover_state = gets.chomp

    new_book = Book.new(publish_date, publisher, cover_state)

    # Save
    File.open('data/books.json', 'a') do |file|
      file.puts new_book.to_json
    end

    puts '-----------------------------------'
    puts 'successfully ADDED!!'
    puts '-----------------------------------'
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
      puts "There is no books yet!"
    end
  end
end
