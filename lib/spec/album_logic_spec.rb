require_relative '.././music/album_logic'
require_relative '.././music/music_album'
require 'json'

describe AlbumLogic do
  include AlbumLogic
  context 'Test module methods' do
    it 'Should list albums' do
      albums = []
      expect(list_all_albums(albums)).to eq nil
    end
  end
end
