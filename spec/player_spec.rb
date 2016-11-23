require "player"

describe Player do

  it "returns its name" do
    dan = Player.new("Dan")
    expect(dan.name).to eq("Dan")
  end
end
