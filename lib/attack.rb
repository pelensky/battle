class Attack

  attr_reader :player

  def initialize(player)
    @player = player
  end

  def run
    player.deduct
  end



end
