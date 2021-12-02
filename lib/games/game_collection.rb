require 'json'
require_relative './game'
require_relative '../items/author'
require_relative '../helpers/collection_handler'

module GameCollection
  include CollectionHandler
  attr_accessor :games

  def add_game
    print 'Title: '
    title = gets.chomp
    print 'Is a multiplayer game? [Y/N]: '
    multiplayer = gets.chomp.capitalize == 'Y'
    print 'For how many years you dont play this game?: '
    last_played_at = gets.chomp
    print 'Please state how many years ago it was published: '
    published_date = gets.chomp
    new_game = Game.new(title, multiplayer, last_played_at, published_date)
    @games.push(new_game)
    puts 'Game created succesfully'
    puts ''
  end

  def list_all_games
    return if check_empty(@games, 'Games', '9')

    @games.each_with_index do |game, idx|
      puts "[#{idx}] - #{game}"
    end
    puts
  end

  def list_all_authors
    return if check_empty(@authors, 'Authors', '12')

    @authors.each_with_index do |author, idx|
      puts "[#{idx}] - #{author}"
    end
    puts
  end

  def add_a_author
    item = select_item_for('Author')
    return unless item

    puts 'Item Selected.'
    previous_author = nil

    unless @authors.empty?
      print 'Do you want to add this Item to a existing Label? [Y/N]: '
      previous_author = true if gets.chomp.capitalize == 'Y'
    end

    if previous_author
      option_id = select_author_from_list

      if option_id
        item.add_author(@authors[option_id])
        puts "Item added to Author with Id: #{@authors[option_id].id}\n\n"
      end
    else
      create_new_author(item)
    end
  end

  private

  def select_author_from_list
    puts 'Select a Label from this option List: '
    @authors.each_with_index do |author, idx|
      puts "[#{idx}] - #{author}"
    end

    print 'Select your option: '
    option_id = gets.chomp.to_i

    if option_id.abs >= @authors.length
      puts "Item could not be added to Author with Id: #{@authors[option_id].id}\n\n"
      return false
    end
    option_id
  end

  def check_empty(list, list_name, option)
    puts "#{list_name} list is empty, try adding a new value by selecting number #{option}" if list.empty?
  end

  def create_new_author(item)
    print 'Insert Author Fisrt Name: '
    first_name = gets.chomp
    print 'Insert Author Last Name: '
    last_name = gets.chomp

    new_author = Author.new(first_name, last_name)
    @authors << new_author
    item.add_author(new_author)
    puts "Author created successfully\n\n"
  end
end
