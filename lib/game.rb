class Game

attr_reader :player1, :player2

def initialize(player1, player2)
  @player1 = player1
  @player2 = player2
  @turn_number = 0
end

  def attack
    player_defend.reduce_health
    turn_increment
  end

  def player_defend
    return player2 if even_turn?
    player1
  end

  def player_attack
    return player1 if even_turn?
    player2
  end

  def lose?
    player_attack.health <= 0
  end

  private
  attr_accessor :turn_number

  def even_turn?
    turn_number % 2 == 0
  end

  def turn_increment
    @turn_number += 1
  end
end
