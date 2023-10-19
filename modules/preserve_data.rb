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
    if File.exist?('data/games.json')
      file_data = JSON.parse(File.read('data/games.json'))
      @games = file_data.map do |item|
        game_obj = Game.new(item['multiplayer'], item['last_played_at'], item['publish_date'])
        game_obj.id = item['id']
        game_obj
      end
      @games
    else
      puts 'Games data file does not exist'
      []
    end
  end

  def save_games_data
    File.write('data/games.json', JSON.pretty_generate(@games))
  end

  def load_authors_data
    if File.exist?('data/authors.json')
      file_data = JSON.parse(File.read('data/authors.json'))
      @authors = file_data.map { |item| Author.new(item['first_name'], item['last_name'], item['id']) }
    else
      puts 'Authors data file does not exist'
    end
  end

  def save_authors_data
    File.write('data/authors.json', JSON.pretty_generate(@authors))
  end
end
