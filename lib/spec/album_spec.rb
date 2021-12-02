require_relative '.././music/music_album'
require 'json'

describe MusicAlbum do
  context 'When testing creation of Album instance' do
    it 'Create a MusicAlbum with correct values for instance parameters' do
      new_album = MusicAlbum.new(true, '19970622')
      expect(new_album.on_spotify).to eq true
      expect(new_album.published_date).to eq Date.iso8601('19970622')
    end
    it 'Create a MusicAlbum with incorrect value for published_date' do
      new_album = MusicAlbum.new(true, 2)
      expect(new_album.on_spotify).to eq true
      expect(new_album.published_date).to eq Date.today
    end
  end
  context 'Album can be archived? true or false' do
    it 'album.move_to_archive => album.archived == true' do
      new_album = MusicAlbum.new(true, '20011202')
      new_album.move_to_archive
      expect(new_album.archived).to eq true
    end
    it 'album.move_to_archive => album.archived == false' do
      new_album = MusicAlbum.new(true, '20211202')
      new_album.move_to_archive
      expect(new_album.archived).to eq false
    end
  end
  context 'When testing the Album methods' do
    it 'Should parse album data' do
      new_album = MusicAlbum.new(true, '20210101')
      expect(new_album.to_json(new_album)).to eq '{"on_spotify":true,"published_date":"2021-01-01","archived":false}'
    end
    it 'Should create instance from json' do
      # rubocop:disable Layout/LineLength
      new_album = MusicAlbum.from_json(JSON.parse('{"on_spotify":false,"published_date":"2021-01-01","archived":false}'))
      # rubocop:enable Layout/LineLength
      expect(new_album.on_spotify).to eq false
    end
  end
end
