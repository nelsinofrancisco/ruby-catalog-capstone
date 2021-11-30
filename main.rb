# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
require_relative './lib/music/album_logic'
require_relative './lib/games/games_module'

class App
  attr_reader :albums, :genres, :game_list

  include GameLogic
  include AlbumLogic
  def initialize
    @albums = []
    @genres = []
    @game_list = []
    @authors_list =[]
  end
end

def main
  app = App.new
  option = nil
  app.get_games_data
  puts 'Welcome To Catalog Of My Things App'

  while option != '11'

    puts 'Please choose an option by entering a number:'
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
    puts '11 = Add a genre'
    puts '12 = Exit'

    option = gets.chomp.to_i

    case option
    when 1
      puts 'Implement here your method'
    when 2
      app.list_all_albums(app.albums) unless app.check_empty(app.albums, 'Albums', '9')
    when 3
      app.list_all_games
    when 4
      app.list_all_genres(app.genres) unless app.check_empty(app.genres, 'Genres', '11')
    when 5
      puts 'Impleme'
    when 6
      app.list_all_authors
    when 7
      puts 'Implement here your methsod'
    when 8
      puts 'Implement here your m4ethod'
    when 9
      app.albums.push(app.create_album)
    when 10
      app.add_game
    when 11
      app.genres.push(app.create_genre)
    when 12
      # app.save_data
      app.save_games_data
      puts 'Thank you for using this great App'
      break
    else
      puts 'Wrong input! Please enter a valid option between 1 and 11'
    end
    puts ''
  end
end

# rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength
main
