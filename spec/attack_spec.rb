require 'attack'

describe Attack do

  subject (:attack) {described_class.new(player)}
  let (:player) {instance_double "Player"}

  describe '#run' do
    it 'attacks a player' do
      expect(player).to receive(:deduct)
      attack.run
    end
  end

end
