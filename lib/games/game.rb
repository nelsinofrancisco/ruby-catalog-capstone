require_relative './.././../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :archived, :published_date, :title

  def initialize(title, multiplayer, last_played_at, published_date)
    super(published_date)
    @title = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_s
    str = "Id: #{item.id}, Published at: #{item.published_date}, "
    str += "Title: #{item.title}, IsMultiplayer?:  #{item.multiplayer}, Last Played At: #{item.last_played_at}"
    str
  end

  private

  def can_be_archived?
    response = super
    response && last_played_at > 2
  end
end
