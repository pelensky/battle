srequire 'player'

RSpec.describe Player do
    subject(:player1) { described_class.new("jack") }
    subject(:player2) { described_class.new("elizabeth") }
    describe "name" do
      it 'returns the name' do
        expect(player1.name).to eq "jack"
      end
    end

    describe '#hit_points' do
      it 'starts with 60 HP' do
        expect(player1.hit_points).to eq described_class::MAX_POINTS
      end
    end

    describe '#deduct' do
      it 'deducts 10 points following an attack' do
        expect{player1.deduct}.to change{player1.hit_points}.by(-10)
      end
    end


end
