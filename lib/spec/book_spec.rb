require './lib/books/book'
require 'rspec'

describe Book do
  before(:each) do
    @book_8 = Book.new('2013-02-12', 'Orbit', 'Good', archived: false)
    @book_2 = Book.new('2019-02-12', 'Orbit', 'Bad', archived: false)
    @book_10 = Book.new('20110212', 'Orbit', 'Good', archived: false)
    @book_wrong_date_format = Book.new('xxxx', 'Orbit', 'Good', archived: false)
  end

  context 'Checking the format of published_date instance variable' do
    it 'pub_date is in a wrong format => pub_date == Date.today' do
      expect(@book_wrong_date_format.published_date).to eq Date.today
    end
    it 'pub_date is correct => pub_date = Date.iso8601(pub_date)' do
      book_10_date = '20110212'
      book_2_date = '2019-W05-6'
      book_8_date = '2013-02-12'
      expect(@book_10.published_date).to eq Date.iso8601(book_10_date)
      expect(@book_8.published_date).to eq Date.iso8601(book_2_date)
      expect(@book_2.published_date).to eq Date.iso8601(book_8_date)
    end
  end
end
