require_relative '.././../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :published_date

  def initialize(on_spotify, published_date, archived: false)
    super(published_date, archived: archived)
    @on_spotify = on_spotify
  end

  def to_json(*_args)
    JSON.dump({
                on_spotify: @on_spotify,
                published_date: @published_date,
                archived: @archived
              })
  end

  def to_s
    str = "Id: #{id}, Published at: #{published_date},"
    str += " On Spotify?: #{on_spotify}"
    str
  end

  def self.from_json(data)
    new(data['on_spotify'], data['published_date'], archived: data['archived'])
  end

  private

  def can_be_archived?
    return true if on_spotify && super

    false
  end
end
