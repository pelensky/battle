class Player

  attr_accessor :name, :health

  def initialize(name)
    @name = name
    @health = 60
  end

  def reduce_health
    self.health -= rand(5..15)
  end


  private

  attr_writer :health
end
