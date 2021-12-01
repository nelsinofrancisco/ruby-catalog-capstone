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

  def read_games_data
    unless File.exist?('./lib/games/json/games.json')
      File.open('./lib/games/json/games.json', 'a') { |f| f.write(JSON.generate([])) }
    end

    unless File.exist?('./lib/games/json/authors.json')
      File.open('./lib/games/json/authors.json', 'a') { |f| f.write(JSON.generate([])) }
    end

    saved_games_data = JSON.parse(File.read('./lib/games/json/games.json'))
    saved_authors_data = JSON.parse(File.read('./lib/games/json/authors.json'))

    saved_games_data.each do |game|
      new_game = Game.new(game['title'], game['multiplayer'], game['last_played_at'], game['published_date'])
      @game_list.push(new_game)
    end

    saved_authors_data.each do |author|
      new_author = Author.new(author['first_name'], author['last_name'])
      @authors_list.push(new_author)
    end
  end

  def save_games_data
    games_data_to_save = []
    @game_list.each do |game|
      games_data_to_save.push({ title: game.title, multiplayer: game.multiplayer, last_played_at: game.last_played_at, published_date: game.published_date })
    end

    authors_data_to_save = []
    @authors_list.each do |author|
      authors_data_to_save.push({ first_name: author.first_name, last_name: author.last_name })
    end

    File.open('./lib/games/json/games.json', 'w+') { |f| f.write(JSON.generate(games_data_to_save)) }
    File.open('./lib/games/json/authors.json', 'w+') { |f| f.write(JSON.generate(@authors_list)) }
  end
end

# rubocop:enable Layout/LineLength
