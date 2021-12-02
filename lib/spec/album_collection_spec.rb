require_relative '.././music/album_collection'
require 'json'

describe AlbumCollection do
  before(:each) do
    @album_collection = Class.new
    @album_collection.extend(AlbumCollection)
    @album_collection.instantiate_common_variables
  end

  context 'create_album => asks user options to add a album' do
    it 'create_album with an incorrect time format for published_date => published date == Date.today' do
      # Mocking the creation of a book with user input;
      on_spotify = 'y'
      date = '2021'

      allow(@album_collection).to receive(:gets).and_return(on_spotify, date)

      @album_collection.create_album

      expect(@album_collection.albums[0].published_date).to eq Date.today
      expect(@album_collection.albums[0].on_spotify).to eq true
    end
    it 'create_album receives an incorrect value for on_spotify' do
      # Mocking the creation of a book with user input;
      on_spotify1 = 'Obviously this is incorrect'
      on_spotify2 = 'n'
      date = '2021'

      allow(@album_collection).to receive(:gets).and_return(on_spotify1, on_spotify2, date)

      expect($stdout).to receive(:puts).with('Wrong input! Please try type Y/y for yes or N/n for no:')
      @album_collection.create_album
      expect(@album_collection.albums[0].published_date).to eq Date.today
      expect(@album_collection.albums[0].on_spotify).to eq false
    end
  end

  context 'create_album with multiple MusicAlbums => @albums.size > 1' do
    it 'create_album => @albums[0] & @albums[1] instance variables should equal input' do
      # Mocking the creation of a book with user input;
      on_spotify1 = 'y'
      date1 = '2021-W06-2'

      on_spotify2 = 'n'
      date2 = '20200212'

      allow(@album_collection).to receive(:gets).and_return(on_spotify1, date1, on_spotify2, date2)

      @album_collection.create_album
      @album_collection.create_album

      expect(@album_collection.albums[0].published_date).to eq Date.iso8601(date1)
      expect(@album_collection.albums[0].on_spotify).to eq true
      expect(@album_collection.albums[1].published_date).to eq Date.iso8601(date2)
      expect(@album_collection.albums[1].on_spotify).to eq false
    end
  end

  context 'list_all_albums => without loading from json files' do
    it 'list_all_albums when there is no album in the collection' do
      expect do
        @album_collection.list_all_albums
      end.to output("Albums list is empty, try adding a new value by selecting number [8]\n\n").to_stdout
    end
    it 'list_all_albums with only one album in the albums list => album.to_s' do
      on_spotify = 'y'
      date = '20211205'

      allow(@album_collection).to receive(:gets).and_return(on_spotify, date)

      @album_collection.create_album

      # Mock What the Function should output for each album
      @album_collection.albums.each_with_index do |album, idx|
        expect($stdout).to receive(:puts).with("[#{idx}] - #{album}")
      end
      expect($stdout).to receive(:puts)

      @album_collection.list_all_albums
    end
    it 'list_all_albums with more than one album in the albums list => album.to_s' do
      on_spotify1 = 'y'
      date1 = '2021-W06-2'

      on_spotify2 = 'n'
      date2 = '20200212'

      allow(@album_collection).to receive(:gets).and_return(on_spotify1, date1, on_spotify2, date2)

      @album_collection.create_album
      @album_collection.create_album

      # Mock What the Function should output for each book
      @album_collection.albums.each_with_index do |book, idx|
        expect($stdout).to receive(:puts).with("[#{idx}] - #{book}")
      end
      expect($stdout).to receive(:puts)

      @album_collection.list_all_albums
    end
  end
end
