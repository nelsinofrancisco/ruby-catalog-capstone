require './lib/items/author'
require './item'

describe Author do
  describe 'Testing the author class' do
    context 'When creating new author class' do
      it 'Should create a new author when we call the class new method' do
        new_author = Author.new('first name', 'Last name')
        expect(new_author.first_name).to eq 'first name'
        expect(new_author.last_name).to eq 'Last name'
      end
    end
  end

  describe 'Testing the author class methods' do
    context 'When an item adds the add_author method it should save the items in author class' do
      it 'Should fill an array with items' do
        item1 = Item.new(3)
        new_author = Author.new('first name', 'Last name')
        item1.add_author(new_author)
        expect(new_author.items).to have_attributes(size: 1)

        item2 = Item.new(10)
        item2.add_author(new_author)
        expect(new_author.items).to have_attributes(size: 2)
      end
    end

    context "When an item it's in the array should not save it again" do
      it 'Should cancel the method' do
        item1 = Item.new(3)
        new_author = Author.new('first name', 'Last name')
        item1.add_author(new_author)
        expect(new_author.items).to include item1

        item1.add_author(new_author)
        puts new_author.items
        expect(new_author.items.length).to eq 1
      end
    end
  end
end
