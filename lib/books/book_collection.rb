require_relative 'book'
require_relative './../items/label'
require_relative '../helpers/collection_handler'

module BookCollection
  include CollectionHandler

  def list_all_books
    return if check_empty(@books, 'Books', '7')

    @books.each_with_index do |book, idx|
      puts "[#{idx}] - #{book}"
    end
    puts
  end

  def list_all_labels
    return if check_empty(@books, 'Labels', '10')

    @labels.each do |label|
      puts "Id: #{label.id}, Title: #{label.title}, Author: #{label.color}"
    end
    puts
  end

  def add_a_book
    print 'Insert Published Date: '
    date = gets.chomp
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
    return unless item

    puts 'Item Selected.'
    previous_label = nil

    unless @labels.empty?
      print 'Do you want to add this Item to a existing Label? [Y/N]: '
      previous_label = true if gets.chomp.capitalize == 'Y'
    end

    if previous_label
      option_id = select_label_from_list

      if option_id
        item.add_label(@labels[option_id])
        puts "Item added to Label with Id: #{@labels[option_id].id}\n\n"
      end
    else
      create_new_label(item)
    end
  end

  private

  def check_empty(list, list_name, option)
    puts "#{list_name} list is empty, try adding a new value by selecting number #{option}" if list.empty?
  end

  def select_label_from_list
    puts 'Select a Label from this option List: '
    @labels.each_with_index do |label, idx|
      puts "[#{idx}] - #{label}"
    end

    print 'Select your option: '
    option_id = gets.chomp.to_i

    if option_id.abs >= @labels.length
      puts "Item could not be added to Label with Id: #{@labels[option_id].id}\n\n"
      return false
    end
    option_id
  end

  def create_new_label(item)
    print 'Insert Label Title: '
    title = gets.chomp
    print 'Insert Label Color: '
    color = gets.chomp

    new_label = Label.new(title, color)
    @labels << new_label
    item.add_label(new_label)
    puts "Label created successfully\n\n"
  end
end
