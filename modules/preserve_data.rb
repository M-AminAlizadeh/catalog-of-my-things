require 'json'

module PreserveData
    def load_files_data
        load_games_data
        load_authors_data
    end

    def save_files_data
        save_authors_data
        save_games_data
    end

    def load_games_data
        if File.exist?('games.json')
            file_data = JSON.parse(File.read('games.json'))
            @games = file_data.map do |item|
              game_obj = Game.new(item['multiplayer'], item['last_played_at'], item['publish_date'])
              author_data = item['author']
              
              if author_data
                author = @authors.find { |a| a.id == author_data['id'] }
                game_obj.author = author
              end
        
              game_obj
            end
        else
            puts "Games data file does not exist"
        end
    end
      
    def save_games_data
        File.write('games.json', JSON.pretty_generate(@games))
    end

    def load_authors_data
        if File.exist?('authors.json')
            file_data = JSON.parse(File.read('authors.json'))
            @authors = file_data.map do |item| 
                Author.new(item['first_name'], item['last_name'], item['id'])
            end
        else
            puts "Authors data file does not exist"
        end
    end

    def save_authors_data
        File.write('authors.json', JSON.pretty_generate(@authors))
    end
end