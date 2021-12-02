require_relative '.././music/album_collection'
require_relative '.././music/music_album'
require 'json'

describe AlbumCollection do
  include AlbumCollection
  context 'Test module methods' do
    it 'Should list albums' do
      albums = []
      expect(list_all_albums(albums)).to eq nil
    end
  end
end
