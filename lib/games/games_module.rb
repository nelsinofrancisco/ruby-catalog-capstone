# rubocop:disable Layout/LineLength
require 'json'
require_relative './game'
require_relative '../items/author'

module GameLogic
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
    @game_list.push(title: new_game.title, multiplayer: new_game.multiplayer, last_played_at: new_game.last_played_at, published_date: new_game.published_date)
    puts 'Game created succesfully'
    puts ''
  end

  def list_all_games
    @game_list = JSON.parse(File.read('./lib/games/json/games.json'))
    if @game_list.empty?
      puts 'There are no games in the list yet, please add one first'
    else
      @game_list.each do |game|
        puts "Title: #{game['title']}, Multiplayer: #{game['multiplayer']}, Last Time Played:#{game['last_played_at']} years ago, Published #{game['published_date']} years ago"
      end
    end
  end

  def list_all_authors
    @authors_list = JSON.parse(File.read('./lib/games/json/authors.json'))
    if @authors_list.empty?
      puts 'There are no games in the list yet, please add one first'
    else
      @authors_list.each do |author|
        puts "Title: #{author['first_name']}, Multiplayer: #{author['last_name']}"
      end
    end
  end

  def read_games_data
    if File.exist?('./lib/games/json/games.json')
      File.open('./lib/games/json/games.json', 'a') { |f| f.write(JSON.generate([])) }
    elsif File.exist?('./lib/games/json/authors.json')
      File.open('./lib/games/json/authors.json', 'a') { |f| f.write(JSON.generate([])) }
    end
  end

  def save_games_data
    File.open('./lib/games/json/games.json', 'w+') { |f| f.write(JSON.generate(game_list)) }
    File.open('./lib/games/json/authors.json', 'w+') { |f| f.write(JSON.generate(@authors_list)) }
  end
end

# rubocop:enable Layout/LineLength
