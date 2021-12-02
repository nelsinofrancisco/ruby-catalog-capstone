class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(first_name, last_name)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def to_s
    "Id: #{id}, First Name: #{first_name}, Last Name: #{last_name}"
  end

  def add_item(item)
    @items << item
    item.add_author(self) unless item.author
  end

  def to_json(*_args)
    JSON.dump(
      first_name: @first_name,
      last_name: @last_name,
      items: @items.map(&:to_json)
    )
  end

  def self.from_json(data)
    new(data['first_name'], data['last_name'])
  end
end
