require 'game'

describe Game do
  subject(:game) { described_class.new(player1,player2) }
  let(:player1) { double :player1 , is_paralysed?: false}
  let(:player2) { double :player2 , is_paralysed?: false, unparalyse: nil}


  describe "Attack" do
    it "should decrease players health" do
      expect(game.player_defense).to receive(:take_damage)
      game.attack
    end
  end

  describe "Storing player attributes" do
    it "should store players as attributes" do
      game.turn_switch
      expect(game.player_attack).to eq player1
      expect(game.player_defense).to eq player2
    end

  end

  describe "Paralyse" do
    it "should damage an opponent" do
      expect(game.player_defense).to receive(:take_paralysis)
      game.paralyse
    end
  end


end
