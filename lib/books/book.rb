class Book
  attr_accessor :publisher, :cover_state

  def initiliaze(publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
  end
end
