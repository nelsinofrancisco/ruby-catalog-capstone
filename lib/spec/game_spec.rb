require './lib/games/game.rb'

describe Game do
  describe 'Testing the Game class' do
    context 'When creating new Game class' do
      it 'Should create a new game when we call the class new method' do
        new_game = Game.new('test', true, 3, 5)
        expect(new_game.title).to eq 'test'
        expect(new_game.multiplayer).to eq true
        expect(new_game.last_played_at).to eq 3
        expect(new_game.published_date).to eq 5
      end
    end
  end

  describe 'Testing the Game class methods' do
    context 'When can_be_archived method is called' do
      it "Should return true if parent's method returns true AND if last_played_at is older than 2 years, otherwise returns false" do
        new_game1 = Game.new('test', true, 3, 5)
        expect(new_game1.can_be_archived?).to eq false

        new_game2 = Game.new('test', true, 4, 11)
        expect(new_game2.can_be_archived?).to eq true

        new_game3 = Game.new('test', true, 1, 15)
        expect(new_game3.can_be_archived?).to eq false
      end
    end
  end
end
