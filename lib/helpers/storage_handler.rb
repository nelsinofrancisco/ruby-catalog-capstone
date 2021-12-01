require_relative './preserve_data'

module StorageHandler
  include PreserveData
  # This method must be run in initialize method of the class that it's including it
  def instantiate_common_variables
    @albums = []
    @books = []
    @game_list = []
    @genres = []
    @labels = []
    @authors = []
  end

  private

  def select_item_for(class_name)
    options = list_available_items

    if options.empty?
      puts 'You need to add a Item to the collection first'
      return false
    end

    display_items_options(options, class_name)

    print 'Select your Option: '
    option_id = gets.chomp.to_i

    items = options.values[option_id]

    items.each_with_index do |item, i|
      puts display_items_of_class(item, i)
    end

    print "\nEnter the Item Option: "
    item_index = gets.chomp.to_i

    if item_index.abs > items.length
      puts "We don't have that Item, try again.\n\n"
      return false
    end
    items[item_index]
  end

  def display_items_options(options, class_name)
    puts "What type of Item you want to add to #{class_name}? Select a number from options below:"

    options.each_with_index do |(key, _value), i|
      puts "[#{i}] - #{key}"
    end
  end

  def display_items_of_class(item, index)
    case item.class.to_s
    when 'Book'
      general_item = "[#{index}] - Class: #{item.class} Id: #{item.id}, Published at: #{item.published_date} "
      book_chr = "Characteristics: #{item.publisher}, #{item.cover_state}"
      general_item + book_chr
    when 'Game'
      general_item = "[#{index}] - Class: #{item.class} Id: #{item.id}, Published at: #{item.published_date} "
      game_chr = "Characteristics: #{item.multiplayer}, #{item.last_played_at}"
      general_item + game_chr
    when 'MusicAlbum'
      general_item = "[#{index}] - Class: #{item.class} Id: #{item.id}, Published at: #{item.published_date} "
      album_chr = "Characteristics: #{item.on_spotify}"
      general_item + album_chr
    end
  end

  def list_available_items
    available_options = {}
    available_options['books'] = @books unless @books.empty?
    available_options['games'] = @game_list unless @game_list.empty?
    available_options['albums'] = @albums unless @albums.empty?

    available_options
  end
end
