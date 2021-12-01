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
    item.add_label(self, false) unless item.label
  end
end
