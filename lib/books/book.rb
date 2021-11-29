require_relative './.././../item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(published_date, publisher, cover_state, archived: false)
    super(published_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
