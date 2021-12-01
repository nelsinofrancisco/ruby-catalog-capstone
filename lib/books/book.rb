require_relative './.././../item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(published_date, publisher, cover_state, archived: false)
    super(published_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json
    JSON.dump ({
      archived: @archived,
      published_date: @published_date,
      publisher: @publisher,
      cover_state: @cover_state
    })
  end

  def self.from_json(data)
    state = JSON.load data
    self.new(state['published_date'], state['publisher'], state['cover_state'], state['archived'])
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
