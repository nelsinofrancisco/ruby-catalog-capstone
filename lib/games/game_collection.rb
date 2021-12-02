# rubocop:disable Layout/LineLength
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
    return if check_empty(@games, 'Games', '3')

    @games.each_with_index do |game, idx|
      puts "[#{idx}] - #{game}"
    end

    puts
  end

  def list_all_authors
    return if check_empty(@authors, 'Authors', '6')

    @authors_list.each_with_index do |author, idx|
      puts "[#{idx}] - #{author}"
    end

    puts
  end

  private 

  def check_empty(list, list_name, option)
    puts "#{list_name} list is empty, try adding a new value by selecting number #{option}" if list.empty?
  end
end

# rubocop:enable Layout/LineLength
