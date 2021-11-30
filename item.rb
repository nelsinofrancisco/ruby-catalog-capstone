class Item
  attr_reader :id, :archived, :author, :genre, :label, :published_date

  def initialize(published_date, archived: false)
    @id = Random.rand(1..1000)
    @archived = archived
    @author = nil
    @genre = nil
    @label = nil
    @published_date = published_date
  end

  def add_author(author); end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_label(label, set_label_items_variable: true)
    @label = label
    label.add_item(self) if set_label_items_variable
  end

  def move_to_archive
    @archive = true if can_be_archived?
  end

  private

  def can_be_archived?
    @published_date >= 10
  end
end
