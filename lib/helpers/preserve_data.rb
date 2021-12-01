require 'fileutils'
require 'json'

module PreserveData
  def save_collections
    base_folder = './lib/helpers/json'
    FileUtils.mkdir_p(base_folder) unless Dir.exist?(base_folder)
    save_albums
    save_genres
    save_authors
    save_games
  end

  def load_collections
    load_albums
    load_genres
    load_authors
    load_games
  end

  private

  def save_albums
    albums_path = './lib/helpers/json/albums.json'
    json_albums = @albums.map { |album| album.to_json }
    File.write(albums_path, JSON.generate(json_albums))
  end

  def save_genres
    genres_path = './lib/helpers/json/genres.json'
    json_genres = @genres.map { |genre| genre.to_json }
    File.write(genres_path, JSON.generate(json_genres))
  end

  def save_games
    games_data_to_save = []
    @game_list.each do |game|
      games_data_to_save.push({ title: game.title, multiplayer: game.multiplayer, last_played_at: game.last_played_at, published_date: game.published_date })
    end
    File.open('./lib/helpers/json/games.json', 'w+') { |f| f.write(JSON.generate(games_data_to_save)) }
  end

  def save_authors
    authors_data_to_save = []
    @authors_list.each do |author|
      authors_data_to_save.push({ first_name: author.first_name, last_name: author.last_name })
    end
    File.open('./lib/helpers/json/authors.json', 'w+') { |f| f.write(JSON.generate(@authors_list)) }
  end

  def load_albums
    albums_path = './lib/helpers/json/albums.json'
    return [] unless File.exist?(albums_path)

    file = File.open(albums_path)
    file_data = file.read if file
    albums_data = JSON.parse(file_data)
    albums_data.each do |data|
      @albums.push(MusicAlbum.from_json(JSON.parse(data)))
    end
  end

  def load_genres
    genres_path = './lib/helpers/json/genres.json'
    return [] unless File.exist?(genres_path)

    file = File.open(genres_path)
    file_data = file.read if file
    genres_data = JSON.parse(file_data)
    genres_data.each do |data|
      @genres.push(Genre.from_json(JSON.parse(data)))
    end
  end

  def load_games
    games_data_path = './lib/helpers/json/games.json'
    unless File.exist?(games_data_path)
      File.open(games_data_path, 'a') { |f| f.write(JSON.generate([])) }
    end
    saved_games_data = JSON.parse(File.read(games_data_path))
    saved_games_data.each do |game|
      new_game = Game.new(game['title'], game['multiplayer'], game['last_played_at'], game['published_date'])
      @game_list.push(new_game)
    end
  end

  def load_authors
    authors_data_path = './lib/helpers/json/authors.json'
    unless File.exist?(authors_data_path)
      File.open(authors_data_path, 'a') { |f| f.write(JSON.generate([])) }
    end
    saved_authors_data = JSON.parse(File.read(authors_data_path))
    saved_authors_data.each do |author|
      new_author = Author.new(author['first_name'], author['last_name'])
      @authors_list.push(new_author)
    end
  end
end
