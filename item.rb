require 'date'

class Item
  attr_accessor :publish_date, :archived, :label

  def initialize(publish_date, archived: false)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    current_year = Date.today.year
    published_year = @publish_date.to_i
    check_diff = current_year - published_year
    return false unless check_diff > 10

    true
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
