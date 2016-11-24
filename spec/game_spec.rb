require "game"

describe Game do
  subject(:game) {described_class.new(player1, player2) }
  let(:player1) {double(:player1)}
  let(:player2) {double(:player2)}

context "setup" do
  it "should hold a player 1 object " do
    expect(game.player1).to eq(player1)
  end

  it "should hold a player 2 object" do
    expect(game.player2).to eq(player2)
  end
end


context "attack" do

  it "should attack player 2 and reduce health" do
    expect(player2).to receive :reduce_health
    game.attack
  end

end

end
