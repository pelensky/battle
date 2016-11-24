class Player

  attr_accessor :name, :health

  def initialize(name)
    @name = name
    @health = 60
    @poisoned = false
    @poison_count = 0
  end

  def reduce_health(damage = rand(5..15))
    self.health -= damage
  end

  def poison_damage
    reduce_health rand(4..10)
    increment_poison_count
    unpoison if @poison_count >= 3
  end

  def poisoned?
    @poisoned
  end

  def poison
    @poisoned = true
  end

  private
  attr_writer :health

  def increment_poison_count
    @poison_count += 1
  end

  def unpoison
    @poisoned = false
  end
end
