require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date: nil)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  # private

  def can_be_archived?
    super && (Date.today - Date.parse(@last_played_at)).to_i / 365 >= 2
  end
end
