require './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def new_game(multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
end
