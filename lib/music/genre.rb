class Genre
  attr_reader :id, :items
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_genre(self) unless item.genre
  end

  def to_json(*_args)
    JSON.dump(
      name: @name,
      items: @items.map(&:to_json)
    )
  end

  def to_s
    "Id: #{id}, Name: #{name}"
  end

  def self.from_json(data)
    new(data['name'])
  end
end
