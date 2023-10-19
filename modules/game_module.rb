require_relative '../classes/game_class.rb'
require_relative 'author_module'
require 'json'

module GameModule
    include AuthorModule

    def get_user_input(message)
        print message
        gets.chomp
    end

    def list_games
        puts 'Listing Games records'
        if @games.length == 0
            puts "Game Records Found: 0"
        else
            @games.each_with_index do |item, index|
                puts "#{index+1} - ID: #{item.id} Multiplayer: #{item.multiplayer}, last_played: #{item.last_played_at}, Game Published: #{item.publish_date}"
            end
        end
    end

    def create_game
        puts 'Creating a Game Record: '
        multiplayer = get_user_input('Multiplayer[Y/N]: ').casecmp('Y').zero?
        last_played_at = get_user_input('Last played(yyyy-mm-dd): ')
        publish_date = get_user_input('Game publish date(yyyy-mm-dd): ')
        game = Game.new(multiplayer, last_played_at, publish_date)
        author = add_author(game)
        # label = add_lable(game)
        # genre = add_genre(game)
        @games.push(game)

        puts "Game Added Successfully with #{author.class}"
    end
end
