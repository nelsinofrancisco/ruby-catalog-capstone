require_relative './lib/books/book_collection'
# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength

class App
  include BookCollection

  def initialize
    instantiate_commom_variables
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
  puts '12 = Exit'
  print 'Type your option: '
end

def main
  # app = Name_of_class_with_methods.new
  app = App.new
  # app.whatever_we_called_the_read_json_methods
  option = nil
  puts 'Welcome To Catalog Of My Things App'

  while option != '11'
    menu
    option = gets.chomp.to_i

    case option
    when 1
      app.list_all_books
    when 2
      puts 'Implement here your'
    when 3
      puts 'Implement here y'
    when 4
      puts 'Implement he'
    when 5
      app.list_all_labels
    when 6
      puts 'Impl'
    when 7
      puts 'Implement here your methsod'
    when 8
      app.add_a_book
    when 9
      puts 'Implement here you3r method'
    when 10
      puts 'Implement here 1your method'
    when 11
      app.add_a_label
    when 12
      # app.save_data
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
