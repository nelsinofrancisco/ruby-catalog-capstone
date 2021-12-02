require_relative '.././items/label'
require_relative '../../item'
require_relative '.././books/book'
require_relative '.././games/game'
require_relative '.././music/music_album'
require 'json'

describe Label do
  before(:each) do
    @label1 = Label.new('Funny Items', 'Red')
    @label2 = Label.new('Boring Items', 'Gray')
  end
  context 'Label.add_item => set relations between them' do
    it 'Label.add_item(Item: item) => Item.label = self' do
      item = Item.new('2021-12-02')
      @label1.add_item(item)
      expect(@label1.items).to include(item)
      expect(item.label).to eq @label1
    end
    it 'Label.add_item(Book: book) => Book.label = self' do
      book = Book.new('2021-12-02', 'Origin', 'Good')
      @label1.add_item(book)
      expect(@label1.items).to include(book)
      expect(book.label).to eq @label1
    end
    it 'Label.add_item(MA: MA) => MusicAlbum.label = self' do
      music_album = MusicAlbum.new(true, '2021-12-02')
      @label1.add_item(music_album)
      expect(@label1.items).to include(music_album)
      expect(music_album.label).to eq @label1
    end
    it 'Label.add_item(Game: game) => Game.label = self' do
      game = Game.new('Zelda', false, 2, '2021-12-02')
      @label1.add_item(game)
      expect(@label1.items).to include(game)
      expect(game.label).to eq @label1
    end
  end
  context 'Label Serialization' do
    it 'Label.json => JSON object with iv preserved' do
      expected_obj = JSON.dump(
        title: @label2.title,
        color: @label2.color,
        items: @label2.items.map(&:to_json)
      )
      expect(@label2.to_json).to eq expected_obj
    end
    it 'Label.json => JSON object with iv preserved Items != empty' do
      expected_obj = JSON.dump(
        title: @label1.title,
        color: @label1.color,
        items: @label1.items.map(&:to_json)
      )
      expect(@label1.to_json).to eq expected_obj
    end
  end
  context 'Label deserialization' do
    it 'Label.from_json => JSON object with same Title and Color variables' do
      expected_obj1 = JSON.dump(
        title: @label1.title,
        color: @label1.color,
        items: @label1.items.map(&:to_json)
      )

      expected_obj2 = JSON.parse(JSON.dump(
                                   title: @label2.title,
                                   color: @label2.color,
                                   items: @label2.items.map(&:to_json)
                                 ))

      expect(Label.from_json(expected_obj1).title).to eq expected_obj1['title']
      expect(Label.from_json(expected_obj1).color).to eq expected_obj1['color']
      expect(Label.from_json(expected_obj2).title).to eq expected_obj2['title']
      expect(Label.from_json(expected_obj2).color).to eq expected_obj2['color']
    end
  end
end
