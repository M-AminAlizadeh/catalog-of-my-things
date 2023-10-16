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

  def can_be_archived?(publish_date)
    current_year = Date.today.year
    published_year = publish_date.to_i
    check_diff = current_year - published_year
    return unless check_diff > 10

    true
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
