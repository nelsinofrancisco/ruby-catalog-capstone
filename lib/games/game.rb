require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :archived, :published_date

  def initialize(multiplayer, last_played_at, published_date, archived = false)
    super(published_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    response = super
    if response && last_played_at > 2
      true
    else
      false
    end
  end
end
