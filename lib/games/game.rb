require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :archived

  def initialize(multiplayer, last_played_at, published_date, archived: false)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    super(published_date, archived = false)
  end

  def can_be_archived?
    false unless archived && last_played_at < 2
  end
end
