require_relative '../classes/author_class'
require 'json'

module AuthorModule
  def get_user_input(message)
    print message
    gets.chomp
  end

  def list_present_authors
    puts 'Listing Authors present'
    if @authors.empty?
      puts "Authors' Records Found: 0"
    else
      @authors.each_with_index do |item, index|
        puts "#{index + 1} - ID: #{item.id}, First Name: #{item.first_name}, Last Name: #{item.last_name}"
      end
    end
  end

  def add_author(item)
    puts 'Adding Author to the Record: '
    first_name = get_user_input('First Name: ')
    last_name = get_user_input('Last Name: ')
    author = @authors.find do |a|
      a.first_name == first_name && a.last_name == last_name
    end || Author.new(first_name, last_name)
    @authors << author unless @authors.include?(author)
    author.add_item(item)

    author
  end
end
