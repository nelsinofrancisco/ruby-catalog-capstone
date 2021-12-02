require_relative '.././music/genre'
require_relative '../../item'
require 'json'

describe Genre do
  context 'When testing creation of genre instance' do
    it 'Should create a genre when we call the class constructor' do
      new_genre = Genre.new('Test')
      expect(new_genre.name).to eq 'Test'
    end
  end
  context 'When testing genre methods' do
    it 'Should add a new item to the items array' do
      new_genre = Genre.new('Test')
      item = Item.new(2)
      new_genre.add_item(item)
      expect(new_genre.items.length).to eq 1
    end
  end
end
