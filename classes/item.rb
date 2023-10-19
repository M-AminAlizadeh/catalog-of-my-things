require 'date'

class Item
  attr_accessor :publish_date, :author, :genre, :label
  attr_reader :id, :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1...10_000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    date_now = Date.today.year
    past_date = Date.parse(@publish_date).year
    difference = (date_now - past_date).abs
    difference >= 10
  end

  def move_to_archive
    return @archived = true if can_be_archived?

    @archived = false
  end
end
