require 'game'

RSpec.describe Game do

  subject(:game) { described_class.new(player1, player2) }
  let (:player1) { double :player1 }
  let (:player2) { double :player2 }
  let (:attack1) {instance_double "Attack", player: player1, run: nil}
  let (:attack2) { instance_double "Attack", player: player2, run: nil}


  it 'should be initialized with 2 players' do
    expect(game.player1).to eq player1
  end

  it 'should be player\'s 1 turn to begin with'do
    expect(game.turn).to eq player1
  end

  describe '#switch_turn' do

    it 'should switch turns after player 1 attacks' do
      allow(player2).to receive(:deduct)
      attack2.run
      game.switch_turn
      expect(game.turn).to eq player2
    end

    it 'should switch turns again after player 2 attacks' do
      allow(player1).to receive(:deduct)
      allow(player2).to receive(:deduct)
      attack2.run
      game.switch_turn
      attack1.run
      game.switch_turn
      expect(game.turn).to eq player1
    end

  end

  describe '#opponent_of' do
    it 'returns the opponent of the player whose turn it is' do
      expect(game.opponent_of(player1)).to eq player2
      expect(game.opponent_of(player2)).to eq player1
    end
  end

  describe "#game_over" do
    it "should know when a player has got down to 0 HP" do
      

    end
  end
end
