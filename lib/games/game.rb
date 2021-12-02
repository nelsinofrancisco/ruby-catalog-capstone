require_relative './.././../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :archived, :published_date, :title

  def initialize(title, multiplayer, last_played_at, published_date)
    super(published_date)
    @title = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    response = super
    response && last_played_at > 2
  end
end
