require './game'

RSpec.describe Game do
  subject(:game) { described_class.new }
  let (:player1) { double :player }
  describe '#attack' do
    it 'attacks the other player' do
      expect(player1).to receive(:deduct)
      game.attack(player1)
    end
  end
end
