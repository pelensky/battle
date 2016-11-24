class Player

  MAX_POINTS = 60

  attr_reader :name, :hit_points

  def initialize(name)
    @name = name
    @hit_points = MAX_POINTS
  end

  def deduct
    @hit_points -= 10
  end

  def attack(other_player)
    other_player.deduct
  end



end
