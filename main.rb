# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength

class App
  include GameLogic
end

def main
  app = App.new
  # app.whatever_we_called_the_read_json_methods
  option = nil
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
    puts '11 = Exit'

    option = gets.chomp.to_i

    case option
    when 1
      puts 'Implement here your method'
    when 2
      puts 'Implement here your'
    when 3
      app.list_all_games
    when 4
      puts 'Implement he'
    when 5
      puts 'Impleme'
    when 6
      puts 'Impl'
    when 7
      puts 'Implement here your methsod'
    when 8
      puts 'Implement here your m4ethod'
    when 9
      puts 'Implement here you3r method'
    when 10
      puts 'Implement here 1your method'
    when 11
      # app.save_data
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
