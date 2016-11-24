require './player'
RSpec.describe Player do
    subject(:player) { described_class.new("jack") }
    describe "name" do
      it 'returns the name' do
      expect(player.name).to eq "jack"
    end
  end
end
