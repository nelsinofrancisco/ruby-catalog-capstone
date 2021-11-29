class Item
  attr_reader :id, :archived, :author, :genre, :label

  def initialize(published_date, archived: false)
    @id = Random.rand(1..1000)
    @archived = archived
    @author = nil
    @genre = nil
    @label = nil
    @published_date = published_date
  end

  def add_author(author); end

  def add_genre(genre); end

  def add_label(label); end

  def move_to_archive
    @archive = true if can_be_archived?
  end

  private

  def can_be_archived?
    return true unless published_date < 10
  end
end