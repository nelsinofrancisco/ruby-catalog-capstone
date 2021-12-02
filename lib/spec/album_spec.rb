require_relative '.././music/music_album'
require 'json'

describe MusicAlbum do
  context 'When testing creation of Album instance' do
    it 'Should create a new person when we call the class constructor' do
      new_album = MusicAlbum.new(true, 2)
      expect(new_album.on_spotify).to eq true
      expect(new_album.published_date).to eq 2
    end
  end
  context 'When testing the Album methods' do
    it 'Should return true if on_spotify and super are true' do
      new_album = MusicAlbum.new(true, 20)
      expect(new_album.can_be_archived?).to eq true
    end
    it 'Should parse album data' do
      new_album = MusicAlbum.new(true, 10)
      expect(new_album.to_json(new_album)).to eq '{"on_spotify":true,"published_date":10,"archived":false}'
    end
    it 'Should create instance from json' do
      new_album = MusicAlbum.from_json(JSON.parse('{"on_spotify":false,"published_date":10,"archived":false}'))
      expect(new_album.on_spotify).to eq false
    end
  end
end
