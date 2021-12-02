# rubocop:disable Metrics/ModuleLength
require 'fileutils'
require 'json'

module PreserveData
  def save_collections
    base_folder = './lib/helpers/json'
    FileUtils.mkdir_p(base_folder) unless Dir.exist?(base_folder)
    save_books
    save_albums
    save_games
    save_labels
    save_genres
    save_authors
  end

  def load_collections
    load_books
    load_albums
    load_games
    load_labels
    load_genres
    load_authors
  end

  private

  def save_books
    books_path = './lib/helpers/json/books.json'
    json_books = @books.map(&:to_json)
    File.write(books_path, JSON.generate(json_books))
  end

  def save_albums
    albums_path = './lib/helpers/json/albums.json'

    json_albums = @albums.map(&:to_json)
    File.write(albums_path, JSON.generate(json_albums))
  end

  def save_games
    games_path = './lib/helpers/json/games.json'

    json_games = @games.map(&:to_json)
    File.write(games_path, JSON.generate(json_games))
  end

  def save_labels
    labels_path = './lib/helpers/json/labels.json'

    json_labels = @labels.map(&:to_json)
    File.write(labels_path, JSON.generate(json_labels))
  end

  def save_genres
    genres_path = './lib/helpers/json/genres.json'

    json_genres = @genres.map(&:to_json)
    File.write(genres_path, JSON.generate(json_genres))
  end

  def save_authors
    authors_path = './lib/helpers/json/authors.json'

    json_authors = @authors.map(&:to_json)
    File.write(authors_path, JSON.generate(json_authors))
  end

  def load_albums
    albums_path = './lib/helpers/json/albums.json'
    return [] unless File.exist?(albums_path)

    file = File.open(albums_path)
    file_data = file.read if file
    albums_data = JSON.parse(file_data)
    albums_data.each do |data|
      json_data = JSON.parse(data)
      item = MusicAlbum.from_json(json_data)
      @albums << item
      @items[json_data['id']] = item
    end
  end

  def load_books
    books_path = './lib/helpers/json/books.json'
    return [] unless File.exist?(books_path)

    file = File.open(books_path)
    file_data = file.read if file
    books_data = JSON.parse(file_data)
    books_data.each do |data|
      json_data = JSON.parse(data)
      item = Book.from_json(json_data)
      @books << item
      @items[json_data['id']] = item
    end
  end

  def load_games
    games_path = './lib/helpers/json/games.json'
    return [] unless File.exist?(games_path)

    file = File.open(games_path)
    file_data = file.read if file
    games_data = JSON.parse(file_data)
    games_data.each do |data|
      json_data = JSON.parse(data)
      item = Game.from_json(json_data)
      @games << item
      @items[json_data['id']] = item
    end
  end

  def load_genres
    genres_path = './lib/helpers/json/genres.json'
    return [] unless File.exist?(genres_path)

    file = File.open(genres_path)
    file_data = file.read if file
    genres_data = JSON.parse(file_data)
    genres_data.each do |data|
      json_genre = JSON.parse(data)
      item_array = json_genre['items']
      new_genre = Genre.from_json(json_genre)
      load_relations(new_genre, item_array)
      @genres << new_genre
    end
  end

  def load_authors
    authors_path = './lib/helpers/json/authors.json'
    return [] unless File.exist?(authors_path)

    file = File.open(authors_path)
    file_data = file.read if file
    authors_data = JSON.parse(file_data)
    authors_data.each do |data|
      json_author = JSON.parse(data)
      item_array = json_author['items']
      new_author = Author.from_json(json_author)
      load_relations(new_author, item_array)
      @authors << new_author
    end
  end

  def load_labels
    labels_path = './lib/helpers/json/labels.json'
    return [] unless File.exist?(labels_path)

    file = File.open(labels_path)
    file_data = file.read if file
    labels_data = JSON.parse(file_data)

    labels_data.each do |data|
      json_label = JSON.parse(data)
      item_array = json_label['items']
      new_label = Label.from_json(json_label)
      load_relations(new_label, item_array)
      @labels << new_label
    end
  end

  def load_relations(relational_class, array)
    array.each do |item|
      item_id = JSON.parse(item)['id']
      item = @items[item_id]
      # This check is only needed because we can't work with games yet.
      relational_class.add_item(item) unless item.nil?
    end
  end
end
# rubocop:enable Metrics/ModuleLength
