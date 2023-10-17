require_relativev 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, archived, on_spotify: false)
    super(publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return false unless super
    return false unless @on_spotify

    true
  end
end