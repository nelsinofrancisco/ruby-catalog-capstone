# rubocop:disable Layout/LineLength
require_relative './game'
require_relative '../items/author'

module GameLogic

  def initialize
    @game_list = []
  end

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
    @game_list.each do |game|
      puts "Title: \"#{game.title}\", Multiplayer: #{game.multiplayer}, Last Time Played:#{game.last_played_at} years ago, Published #{game.published_date} years ago"
    end
  end

  def list_all_authors
    puts 'There are no authors in the list yet, please add one first'
  end
end

# rubocop:enable Layout/LineLength
