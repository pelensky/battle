require "player"

describe Player do
  subject(:player) { described_class.new("Dan")}

  it "returns its name" do
    expect(player.name).to eq("Dan")
  end

  describe "health and attack" do
    it "should start with 60HP" do
      expect(player.health).to eq 60
    end

    it "should reduce its own health by a number" do
      damage = 10
      expect{player.reduce_health(damage)}.to change{player.health}.by -10
    end

  end

  context "poison" do
    it "should be able to tell if it's poisoned" do
      expect(player).not_to be_poisoned
    end

    it "should become poisoned" do
      player.poison
      expect(player).to be_poisoned
    end

    it "should take poison damage" do
      player.poison
      expect{player.poison_damage(7)}.to change{player.health}.by -7
    end

    it "should recover after three poison damage" do
      player.poison
      3.times{player.poison_damage(7)}
      expect(player).not_to be_poisoned
    end
  end
end
