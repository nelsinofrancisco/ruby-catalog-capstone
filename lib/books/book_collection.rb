require_relative 'book'
require_relative './../items/label'
require_relative './../helpers/variables_interface'
require 'fileutils'
require 'json'

module BookCollection
  include VariablesInterface

  def list_all_books
    puts "Your library don't have books yet. Add one first!" if @books.empty?

    @books.each do |book|
      str1 = "Id: #{book.id} Published at: #{book.published_date}, Publisher: #{book.publisher} "
      str2 = "Cover State: #{book.cover_state}"
      result = str1 + str2
      puts result
    end
    puts
  end

  def list_all_labels
    puts "Your library don't have labels yet. Add one first!" if @books.empty?

    @labels.each do |label|
      puts "Id: #{label.id}, Title: #{label.title}, Author: #{label.color}"
    end
    puts
  end

  def add_a_book
    print 'Insert Published Date: '
    date = gets.chomp.to_i
    print 'Insert Publisher Name: '
    name = gets.chomp.capitalize
    print 'Insert Book cover_state: '
    cover_state = gets.chomp

    new_book = Book.new(date, name, cover_state)
    @books << new_book
    puts 'Book created successfully!'
  end

  def add_a_label
    item = select_item_for('Label')
    puts 'Item Selected.'

    print 'Insert Label Title: '
    title = gets.chomp
    print 'Insert Label Color: '
    color = gets.chomp

    new_label = Label.new(title, color)
    @labels << new_label
    item.add_label(new_label)

    puts "Label created successfully\n\n"
  end

  def save_book_collection
    save_books
    save_labels
  end

  def load_book_collection
    #load_books
    #load_labels
  end

  private

  def save_books
    base_folder = './lib/books/json_data/'
    books_path = './lib/games/json_data/books.json'
    labels_path = './lib/games/json_data/labels.json'

    FileUtils.mkdir_p(base_folder) unless Dir.exist?(base_folder)
    json_books = @books.map { |book| book.to_json}
    File.write(books_path, JSON.generate(json_books))
  end

  def save_labels
    base_folder = './lib/books/json_data/'
    labels_path = './lib/games/json_data/labels.json'

    FileUtils.mkdir_p(base_folder) unless Dir.exist?(base_folder)
    json_labels = @labels.map { |label| label.to_json }
    File.write(labels_path, JSON.generate(json_labels))
  end

  def load_books

  end

  def load_labels

  end
end
