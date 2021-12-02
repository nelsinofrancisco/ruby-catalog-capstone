# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
require_relative './lib/books/book_collection'
require_relative './lib/music/album_collection'
require_relative './lib/games/game_collection'

class App
  include GameCollection
  include AlbumCollection
  include BookCollection

  def initialize
    instantiate_common_variables
  end
end

def menu
  puts "Please choose an option by entering a number:\n\n"
  puts '1 - List all books'
  puts '2 - List all music albums'
  puts '3 - List all games'
  puts '4 - list all genres'
  puts '5 - List all labels'
  puts '6 - List all authors'
  puts '7 - Add a book'
  puts '8 - Add a music album'
  puts '9 - Add a game'
  puts '10 - Add a Label'
  puts '11 - Add a Genre'
  puts '12 - Add a Author'
  puts '13 - Exit'
  print 'Type your option: '
end

def main
  app = App.new
  app.load_collections
  option = nil
  puts 'Welcome To Catalog Of My Things App'

  while option != '13'
    menu

    option = gets.chomp.to_i

    case option
    when 1
      app.list_all_books
    when 2
      app.list_all_albums
    when 3
      app.list_all_games
    when 4
      app.list_all_genres
    when 5
      app.list_all_labels
    when 6
      app.list_all_authors
    when 7
      app.add_a_book
    when 8
      app.create_album
    when 9
      app.add_game
    when 10
      app.add_a_label
    when 11
      app.create_genre
    when 12
      app.add_a_author
    when 13
      app.save_collections
      puts "\nSaving and exiting..."
      break
    else
      puts 'Wrong input! Please enter a valid option between 1 and 11'
    end
    puts ''
  end
end

# rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength
main
