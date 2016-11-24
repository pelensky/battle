class Player

  attr_accessor :name, :health

  def initialize(name)
    @name = name
    @health = 60
  end

  def reduce_health
    self.health -= 10
  end

  def attack(target)
    target.reduce_health
  end
  private

  attr_writer :health
end