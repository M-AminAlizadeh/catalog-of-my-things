require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, archived, on_spotify)
    super(publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  def self.can_be_archived?(publish_date, on_spotify)
    return false unless super(publish_date)
    return false unless on_spotify

    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'on_spotify' => @on_spotify,
      'label' => {
        'title' => @label.title,
        'color' => @label.color
      },
      'genre' => {
        'name' => @genre.name
      },
      'author' => {
        'first_name' => @author.first_name,
        'last_name' => @author.last_name
      }
    }.to_json(*args)
  end
end
