require_relative './.././../item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(published_date, publisher, cover_state, archived: false)
    super(published_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json(*_args)
    JSON.dump(
      id: @id,
      archived: @archived,
      published_date: @published_date,
      publisher: @publisher,
      cover_state: @cover_state
    )
  end

  def self.from_json(data)
    new(data['published_date'], data['publisher'], data['cover_state'], archived: data['archived'])
  end

  def to_s
    str = "Id: #{id}, Published at: #{published_date},"
    str += " Publisher: #{publisher}, Cover State: #{cover_state}"
    str
  end

  private

  def can_be_archived?
    super || @cover_state.downcase == 'bad'
  end
end
