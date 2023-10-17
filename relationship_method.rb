require_relative 'genrelist'
# to call creating_genre method or list all genres

def add_some_sort_relationship
  if @genres.length.positive?
    puts '\n\nPlease press 1 to create a genre or 2 to choose from the list'
    list_all_genres
    choice = gets.chomp.to_i

    case choice
    when 1
      creating_genre
      puts '\nChoose from the list below by number and not the ID'
      list_all_genres
      @genre_choice = gets.chomp.to_i

    when 2
      puts '\nChoose from the list below by number and not the ID'
      list_all_genres
      @genre_choice = gets.chomp.to_i

    else
      puts 'invalide number, press 1 to create genre, or 2 to choose from the list'
    end

  else
    creating_genre
  end
end
