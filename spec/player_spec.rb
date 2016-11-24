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

    it "should reduce its own health by a random number" do
      srand(55)
      expect{player.reduce_health}.to change{player.health}.by -15
    end


  end
end
