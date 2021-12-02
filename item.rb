require 'date'

class Item
  attr_reader :id, :archived, :author, :genre, :label, :published_date

  # Date format = "yyyy-mm-dd" || "yyyymmdd"
  def initialize(published_date, archived: false)
    @id = Random.rand(1..1000)
    @archived = archived
    @author = nil
    @genre = nil
    @label = nil
    @published_date = nil

    begin
      @published_date = Date.iso8601(published_date)
    rescue => exception
      @published_date = Date.today
    end
  end

  def add_author(author, validation: true)
    @author = author
    author.add_item(self) if validation
  end

  def add_genre(genre, validation: true)
    @genre = genre
    genre.add_item(self) if validation
  end

  def add_label(label, validation: true)
    @label = label
    label.add_item(self) if validation
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def to_json(*_args)
    JSON.dump(
      id: @id,
      archived: @archived,
      published_date: @published_date
    )
  end

  def self.from_json(data)
    new(data['published_date'], data['archived'])
  end

  private

  def can_be_archived?
    Date.today >= @published_date.next_year(10)
  end
end
