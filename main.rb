def main
  # app = Name_of_class_with_methods.new
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
     puts 'Implement here your method'
    when 3
     puts 'Implement here your method'
    when 4
     puts 'Implement here your method'
    when 5
     puts 'Implement here your method'
    when 6
     puts 'Implement here your method'
    when 7
     puts 'Implement here your method'
    when 8
     puts 'Implement here your method'
    when 9
     puts 'Implement here your method'
    when 10
     puts 'Implement here your method'
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

main
