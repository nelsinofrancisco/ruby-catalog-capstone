# rubocop:disable Layout/LineLength
require 'json'
require_relative './game'
require_relative '../items/author'
require_relative '../helpers/collection_handler'

module GameCollection
  include CollectionHandler
  attr_accessor :game_list

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
    @game_list.push(new_game)
    puts 'Game created succesfully'
    puts ''
  end

  def list_all_games
    if @game_list.empty?
      puts 'There are no games in the list yet, please add one first'
    else
      @game_list.each do |game|
        puts "Title: #{game.title}, Multiplayer: #{game.multiplayer}, Last Time Played:#{game.last_played_at} years ago, Published #{game.published_date} years ago"
      end
    end
  end

  def list_all_authors
    if @authors_list.empty?
      puts 'There are no authors in the list yet, please add one first'
    else
      @authors_list.each do |author|
        puts "Title: #{author.first_name}, Multiplayer: #{author.last_name}"
      end
    end
  end
end

# rubocop:enable Layout/LineLength
