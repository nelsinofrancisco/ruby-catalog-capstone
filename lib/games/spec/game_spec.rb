require_relative '../game.rb'

describe Game do
  context "When testing the Game class" do 
    it "Should create a new game when we call the class new method" do 
      new_game = Game.new('test', true, 3, 5)
      expect(new_game.title).to eq "test"
      expect(new_game.multiplayer).to eq true
      expect(new_game.last_played_at).to eq 3
      expect(new_game.published_date).to eq 5
    end
  end

  # context "When testing the game class" do 
  #   it "Should answer with true or false if the game can use services calling can_use_services? method" do 
  #     new_game = Game.new('1', 30, 'robert')
  #     expect(new_game.can_use_services?).to eq true
  #     new_game1 = Game.new('2', 15, 'jules', false)
  #     expect(new_game1.can_use_services?).to eq false
  #   end
  # end

  # context "When testing the game class" do 
  #   it "Should correct the game name capitalizing first letter and cut to 10 characters with validate_name method" do 
  #     new_game = game.new('1', 30, 'robert')
  #     expect(new_game.validate_name).to eq 'Robert'
  #     new_game1 = game.new('2', 15, 'julesofthesaintroad')
  #     expect(new_game1.validate_name).to eq 'Julesofthe'
  #   end
  # end
end
