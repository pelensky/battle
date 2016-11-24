require "game"

describe Game do
  subject(:game) {described_class.new(player1, player2) }
  let(:player1) {double(:player1, :reduce_health => nil)}
  let(:player2) {double(:player2, reduce_health: nil)}

  context "setup" do
    it "should hold a player 1 object " do
      expect(game.player1).to eq(player1)
    end

    it "should hold a player 2 object" do
      expect(game.player2).to eq(player2)
    end
  end


  context "attack" do

    it "should attack player2 first and reduce health" do
      expect(player2).to receive :reduce_health
      game.attack
    end

    it "should attack player 1 second" do
      game.attack
      expect(player1).to receive :reduce_health
      game.attack
    end

    it "should designate attacking and defending players" do
      expect(game.player_defend).to eq player2
      expect(game.player_attack).to eq player1
    end

    it "should switch them after attack turn" do
      game.attack
      expect(game.player_defend).to eq player1
      expect(game.player_attack).to eq player2
    end

    it "should keep track of damage" do
      srand(55)
      game.attack
      expect(game.damage_did).to eq 15
    end
  end

  context "lose" do
    it "should tell you if someone has lost if their HP is below 0" do
      allow(player1).to receive(:health).and_return 0
      expect(game.lose?).to eq true
    end
  end

  context "poison move" do
    it "should be able to poison a player" do
      expect(player2).to receive(:poison)
      game.poison
    end

    it "should not damage the unpoisoned player" do
      allow(player2).to receive(:poisoned?).and_return(false)
      expect(player2).not_to receive(:poison_damage)
      game.poison_damage
    end

    it "should damage a poisoned player" do
      allow(player2).to receive(:poisoned?).and_return(true)
      expect(player2).to receive(:poison_damage)
      game.poison_damage
    end

    it "should keep track of poison damage" do
      allow(player2).to receive(:poison)
      allow(player2).to receive(:poisoned?).and_return false
      game.poison
      game.attack
      srand(1234)
      game.poison_damage
      expect(game.poison_damage_did).to eq 7
    end
  end

end
