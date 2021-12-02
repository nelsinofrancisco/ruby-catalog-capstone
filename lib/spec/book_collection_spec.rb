require './lib/books/book_collection'
require 'rspec'

describe BookCollection do
  before(:each) do
    @book_collection = Class.new
    @book_collection.extend(BookCollection)
    @book_collection.instantiate_common_variables
  end

  context 'add_a_book => asks user options to add a book' do
    it 'add_a_book with an incorrect time format for published_date => published date == Date.today' do
      # Mocking the creation of a book with user input;
      date = '2021'
      name = 'Good Testing Book'
      cover_state = 'Good'

      allow(@book_collection).to receive(:gets).and_return(date, name, cover_state)

      @book_collection.add_a_book

      expect(@book_collection.books[0].published_date).to eq Date.today
      expect(@book_collection.books[0].publisher).to eq name.capitalize
      expect(@book_collection.books[0].cover_state).to eq cover_state
    end
    it 'add_a_book => @books[0] instance variables should equal input' do
      # Mocking the creation of a book with user input;
      date = '2009-01-01'
      name = 'Good Testing Book'
      cover_state = 'Good'

      allow(@book_collection).to receive(:gets).and_return(date, name, cover_state)

      @book_collection.add_a_book

      expect(@book_collection.books[0].published_date).to eq Date.iso8601(date)
      expect(@book_collection.books[0].publisher).to eq name.capitalize
      expect(@book_collection.books[0].cover_state).to eq cover_state
    end
  end
  context 'add_a_book => more than one time' do
    it 'add_a_book => @books[0] & @books[1] instance variables should equal input' do
      # Mocking the creation of a book with user input;
      date = '2009-01-01'
      name = 'Good Testing Book'
      cover_state = 'Good'

      date1 = '20100105'
      name1 = 'Bad Testing Book'
      cover_state1 = 'Bad'

      allow(@book_collection).to receive(:gets).and_return(date, name, cover_state, date1, name1, cover_state1)

      @book_collection.add_a_book
      @book_collection.add_a_book

      expect(@book_collection.books[0].published_date).to eq Date.iso8601(date)
      expect(@book_collection.books[0].publisher).to eq name.capitalize
      expect(@book_collection.books[0].cover_state).to eq cover_state
      expect(@book_collection.books[1].published_date).to eq Date.iso8601(date1)
      expect(@book_collection.books[1].publisher).to eq name1.capitalize
      expect(@book_collection.books[1].cover_state).to eq cover_state1
    end
  end

  context 'list_all_books => without loading from json files' do
    it 'list_all_books when there is no book in the collection' do
      expect do
        @book_collection.list_all_books
      end.to output("Books list is empty, try adding a new value by selecting number 7\n\n").to_stdout
    end
    it 'list_all_books with only one book in the books list => book.to_s' do
      date = '2009-01-01'
      name = 'Good Testing Book'
      cover_state = 'Good'

      allow(@book_collection).to receive(:gets).and_return(date, name, cover_state)

      @book_collection.add_a_book

      # Mock What the Function should output for each book
      @book_collection.books.each_with_index do |book, idx|
        expect($stdout).to receive(:puts).with("[#{idx}] - #{book}")
      end
      expect($stdout).to receive(:puts)

      @book_collection.list_all_books
    end
  end
  context 'list_all_books => without loading files from json' do
    it 'list_all_books with more than one book in the books list => book.to_s' do
      date = '2009-01-01'
      name = 'Good Testing Book'
      cover_state = 'Good'

      date1 = '20100105'
      name1 = 'Bad Testing Book'
      cover_state1 = 'Bad'

      allow(@book_collection).to receive(:gets).and_return(date, name, cover_state, date1, name1, cover_state1)

      @book_collection.add_a_book
      @book_collection.add_a_book

      # Mock What the Function should output for each book
      @book_collection.books.each_with_index do |book, idx|
        expect($stdout).to receive(:puts).with("[#{idx}] - #{book}")
      end
      expect($stdout).to receive(:puts)

      @book_collection.list_all_books
    end
  end
end
