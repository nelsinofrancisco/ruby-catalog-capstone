require 'fileutils'
require 'json'

module PreserveData
  def save_collections
    save_albums
    save_genres
    save_books
    save_labels
  end

  def load_collections
    load_albums
    load_books
    load_labels
    load_genres
  end

  private

  def save_books
    base_folder = './lib/helpers/json'
    books_path = './lib/helpers/json/books.json'

    FileUtils.mkdir_p(base_folder) unless Dir.exist?(base_folder)
    json_books = @books.map(&:to_json)
    File.write(books_path, JSON.generate(json_books))
  end

  def save_labels
    base_folder = './lib/helpers/json'
    labels_path = './lib/helpers/json/labels.json'

    FileUtils.mkdir_p(base_folder) unless Dir.exist?(base_folder)
    json_labels = @labels.map(&:to_json)
    File.write(labels_path, JSON.generate(json_labels))
  end

  def save_albums
    base_folder = './lib/helpers/json'
    albums_path = './lib/helpers/json/albums.json'

    FileUtils.mkdir_p(base_folder) unless Dir.exist?(base_folder)
    json_albums = @albums.map(&:to_json)
    File.write(albums_path, JSON.generate(json_albums))
  end

  def save_genres
    base_folder = './lib/helpers/json'
    genres_path = './lib/helpers/json/genres.json'

    FileUtils.mkdir_p(base_folder) unless Dir.exist?(base_folder)
    json_genres = @genres.map(&:to_json)
    File.write(genres_path, JSON.generate(json_genres))
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
