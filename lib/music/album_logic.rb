require_relative './music_album'
require_relative './genre'
require_relative '.././../item'

module AlbumLogic
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
    on_spotify = nil
    while on_spotify != 'y' && on_spotify != 'n'
      print 'On Spotify? [Y/N]: '
      on_spotify = gets.chomp.downcase
      case on_spotify
      when 'y'
        permission = true
      when 'n'
        permission = false
      else
        puts 'Wrong input! Please try type Y/y for yes or N/n for no:'
      end
    end
    print 'Published Date: '
    published_date = gets.chomp
    MusicAlbum.new(on_spotify, published_date)
  end

  
  def create_genre
    print 'Name: '
    genre = gets.chomp
    Genre.new(genre)
  end

  def check_empty(list, list_name, option)
    puts "#{list_name} list is empty, try adding a new value by selecting number #{option}" if list.empty?
  end
end
