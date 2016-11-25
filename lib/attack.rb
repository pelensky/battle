class Attack

  attr_reader :player

  def initialize(player)
    @player = player
  end


  def self.run(player)
    new(player).run
  end

  def run
    player.deduct
  end

end
