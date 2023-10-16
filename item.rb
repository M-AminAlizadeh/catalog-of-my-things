require 'date'

class Item
  def initialize(genre, author, label, publish_date, archived: false, id: nil)
    @id = id || Random.rand(1...1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archive(publish_date)
    date = Date.today.to_s.to_i - publish_date.to_i
    return unless date > 10

    true
  end

  def move_to_archive
    return unless can_be_archive

    @archived = true
  end
end
