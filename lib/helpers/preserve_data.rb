require 'fileutils'
require 'json'

module PreserveData
  def save_collections
    base_folder = './lib/helpers/json'
    FileUtils.mkdir_p(base_folder) unless Dir.exist?(base_folder)
    save_albums
    save_genres
  end

  def load_collections
    load_albums
    load_genres
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
end
