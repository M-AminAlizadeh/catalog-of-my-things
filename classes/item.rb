require 'date'

class Item
  attr_accessor :publish_date, :archived
  attr_reader :author, :label, :genre

  def initialize(publish_date, archived: false)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def self.can_be_archived?(publish_date)
    current_year = Date.today.year
    published_year = Date.parse(publish_date).year
    check_diff = current_year - published_year
    return false unless check_diff > 10

    true
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
