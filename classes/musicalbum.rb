require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, archived, on_spotify = false)
    super(publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  def self.can_be_archived?(publish_date, on_spotify)
    return false unless super(publish_date)
    return false unless on_spotify

    true
  end
end
