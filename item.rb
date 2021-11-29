class Item
  attr_reader :id, :archived, :author, :genre, :label

  def initialize(archived: false)
    @id = Random.rand(1..1000)
    @archived = archived
    @author = nil
    @genre = nil
    @label = nil
  end

  def add_author(author); end

  def add_genre(genre); end

  def add_label(label); end

  def can_be_archived?; end

  def move_to_archive; end
end
