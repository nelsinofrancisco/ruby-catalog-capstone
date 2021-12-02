# rubocop:disable Layout/LineLength
require './lib/games/game'

describe Game do
  describe 'Testing the Game class' do
    context 'When creating new Game class' do
      it 'Should create a new game when we call the class new method' do
        new_game = Game.new('test', true, 3, 5)
        expect(new_game.title).to eq 'test'
        expect(new_game.multiplayer).to eq true
        expect(new_game.last_played_at).to eq 3
        expect(new_game.published_date).to eq Date.today
      end
    end
  end

  describe 'Testing the Game class methods' do
    context 'When can_be_archived method is called' do
      it "Should return true if parent's method returns true AND if last_played_at is older than 2 years, otherwise returns false" do
        new_game1 = Game.new('test', true, 3, '2021-12-02')
        new_game1.move_to_archive
        expect(new_game1.archived).to eq false

        new_game2 = Game.new('test', true, 4, '2010-12-02')
        new_game2.move_to_archive
        expect(new_game2.archived).to eq true

        # with an incorrect date today date will be added to the item class
        new_game3 = Game.new('test', true, 1, 15)
        new_game3.move_to_archive
        expect(new_game3.archived).to eq false
      end
    end
  end
end
# rubocop:enable Layout/LineLength
