# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
require_relative './lib/helpers/storage_handler'
require_relative './lib/books/book_collection'
require_relative './lib/music/album_logic'
require_relative './lib/games/games_module'

class App
  attr_reader :albums, :genres, :books, :labels

  include GameLogic
  include AlbumLogic
  include BookCollection

  def initialize
    instantiate_common_variables
  end
end

def menu
  puts "Please choose an option by entering a number:\n\n"
  puts '1 = List all books'
  puts '2 - List all music albums'
  puts '3 - List all games'
  puts '4 = list all genres'
  puts '5 - List all labels'
  puts '6 = List all authors'
  puts '7 = List all sources'
  puts '8 = Add a book'
  puts '9 = Add a music album'
  puts '10 = Add a game'
  puts '11 = Add a Label'
  puts '12 - Add a Genre'
  puts '13 = Exit'
  print 'Type your option: '
end

def main
  app = App.new
  app.load_collections
  option = nil
  puts 'Welcome To Catalog Of My Things App'

  while option != '11'
    menu

    option = gets.chomp.to_i

    case option
    when 1
      app.list_all_books
    when 2
      app.list_all_albums(app.albums) unless app.check_empty(app.albums, 'Albums', '9')
    when 3
      app.list_all_games
    when 4
      app.list_all_genres(app.genres) unless app.check_empty(app.genres, 'Genres', '11')
    when 5
      app.list_all_labels
    when 6
      app.list_all_authors
    when 7
      puts 'Implement here your methsod'
    when 8
      app.add_a_book
    when 9
      app.albums.push(app.create_album)
    when 10
      app.add_game
    when 11
      app.add_a_label
    when 12
      app.create_genre
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
