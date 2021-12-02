require './lib/books/book_collection'
require 'rspec'

describe BookCollection do
  before(:each) do
    @book_collection = Class.new
    @book_collection.extend(BookCollection)
    @book_collection.instantiate_common_variables
  end

  describe 'add_a_book => asks user options to add a book' do
    context 'Adding a book to the collection' do
      it 'add_a_book => @books[0] instance variables should equal input' do
        # Mocking the creation of a book with user input;
        date = '2009'
        name = 'Good Testing Book'
        cover_state = 'Good'
        
        allow(@book_collection).to receive(:gets).and_return(date, name, cover_state)
        
        @book_collection.add_a_book

        expect(@book_collection.books[0].published_date).to eq date
        expect(@book_collection.books[0].publisher).to eq name.capitalize
        expect(@book_collection.books[0].cover_state).to eq cover_state
      end

      it 'add_a_book => @books[0] & @books[1] instance variables should equal input' do
        # Mocking the creation of a book with user input;
        date = '2009'
        name = 'Good Testing Book'
        cover_state = 'Good'
        
        date1 = '2010'
        name1 = 'Bad Testing Book'
        cover_state1 = 'Bad'

        allow(@book_collection).to receive(:gets).and_return(date, name, cover_state, date1, name1, cover_state1)
        
        @book_collection.add_a_book
        @book_collection.add_a_book

        expect(@book_collection.books[0].published_date).to eq date
        expect(@book_collection.books[0].publisher).to eq name.capitalize
        expect(@book_collection.books[0].cover_state).to eq cover_state
        expect(@book_collection.books[1].published_date).to eq date1
        expect(@book_collection.books[1].publisher).to eq name1.capitalize
        expect(@book_collection.books[1].cover_state).to eq cover_state1
      end
    end
  end
end
