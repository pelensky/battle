class Game
  @game = nil

  attr_reader :player1, :player2, :damage_did, :poison_damage_did

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_number = 0
  end

  def self.game
    @game
  end

  def self.game=(value)
    @game = value
  end

  def attack
    @damage_did = rand(5..15)
    player_defend.reduce_health(@damage_did)
    turn_increment
  end

  def poison
    player_defend.poison
    turn_increment
  end

  def poison_damage
    @poison_damage_did = rand(4..10)
    player_defend.poison_damage(@poison_damage_did) if player_defend.poisoned?
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
