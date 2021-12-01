require_relative '.././../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :published_date

  def initialize(on_spotify, published_date, archived: false)
    super(published_date)
    @on_spotify = on_spotify
  end

  def to_json
    JSON.dump ({
      id: @id,
      on_spotify: @on_spotify,
      published_date: @published_date,
      archived: @archived,
    })
  end

  def self.from_json(data)
    self.new(data['on_spotify'], data['published_date'], archived: data['archived'])
  end

  private

  def can_be_archived?
    return true if on_spotify && super

    false
  end
end
