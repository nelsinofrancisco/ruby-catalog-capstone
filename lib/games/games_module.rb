module GameLogic
  def add_game
    @game_list = []
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = true if gets.chomp.capitalize == 'Y'
    new_person = Student.new(classroom, name, age, parent_permission)
    @people.push(new_person)
    puts 'Person created succesfully'
    puts ''
  end

  def list_all_games
    puts @game_list
  end
end