require 'json'

class Label
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(title, color)
    @id = Random.rand(1...10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_label(self) unless item.label
  end

  def to_json(*_args)
    JSON.dump(
      title: @title,
      color: @color,
      items: @items.map(&:to_json)
    )
  end

  def self.from_json(data)
    new(data['title'], data['color'])
  end

  def to_s
    "Id: #{id}, Title: #{title}, Color: #{color}"
  end
end
