require './game'

RSpec.describe Game do

  subject(:game) { described_class.new(player1, player2) }
  let (:player1) { double :player1 }
  let (:player2) { double :player2 }

  describe '#attack' do
    it 'attacks the other player' do
      expect(player1).to receive(:deduct)
      game.attack(player1)
    end
  end


  it 'should be initialized with 2 players' do
    expect(game.player1).to eq player1
  end

  it 'should be player\'s 1 turn to begin with'do
    expect(game.turn).to eq player1
  end

  it 'should switch turns' do
    allow(player2).to receive(:deduct)
    game.attack(player2)
    expect(game.turn).to eq player2
  end

end
