require_relative './music_album'
require_relative './genre'
require_relative '.././../item'
require_relative '../helpers/collection_handler'

module AlbumLogic
  include CollectionHandler

  def list_all_albums(albums)
    albums.each do |album|
      puts "ID: #{album.id}, On Spotify: #{album.on_spotify}"
    end
    puts ''
  end

  def list_all_genres(genres)
    genres.each do |genre|
      puts "ID: #{genre.id}, Genre: #{genre.name}"
    end
    puts ''
  end

  def create_album
    input = nil
    on_spotify = nil
    while input != 'y' && input != 'n'
      print 'On Spotify? [Y/N]: '
      input = gets.chomp.downcase
      case input
      when 'y'
        on_spotify = true
      when 'n'
        on_spotify = false
      else
        puts 'Wrong input! Please try type Y/y for yes or N/n for no:'
      end
    end
    print 'Published Date: '
    published_date = gets.chomp
    MusicAlbum.new(on_spotify, published_date)
  end

  def create_genre
    item = select_item_for('Genre')

    print 'Name: '
    genre = gets.chomp
    genre = Genre.new(genre)
    item.add_genre(genre)
    @genres.push(genre)
  end

  def check_empty(list, list_name, option)
    puts "#{list_name} list is empty, try adding a new value by selecting number #{option}" if list.empty?
  end
end
