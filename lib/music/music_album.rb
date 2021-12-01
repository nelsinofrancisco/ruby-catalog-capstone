require_relative '.././../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :published_date

  def initialize(on_spotify, published_date)
    super(published_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    return true if on_spotify && super

    false
  end
end
