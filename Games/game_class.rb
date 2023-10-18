require './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def new_game(multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?(item)
    super(item) && (Date.today - Date.parse(@last_played_at)).to_i / 365 >= 2
  end
end
