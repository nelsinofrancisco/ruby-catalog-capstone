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
    str = "Id: #{id}, Published at: #{published_date}, "
    str += "Title: #{title}, IsMultiplayer?:  #{multiplayer}, Last Played At: #{last_played_at}"
    str
  end

  def to_json(*_args)
    JSON.dump(
      id: @id,
      title: @title,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      archived: @archived,
      published_date: @published_date
    )
  end

  def self.from_json(data)
    new(data['title'], data['multiplayer'], data['last_played_at'], data['published_date'])
  end

  private

  def can_be_archived?
    response = super
    response && last_played_at > 2
  end
end
