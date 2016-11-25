class Game

  attr_reader :player1, :player2, :turn

  def initialize(player1, player2)
    @turn = player1
    @player1 = player1
    @player2 = player2
  end

  def attack(player)
    player.deduct
  end

  def switch_turn
    @turn = turn == player1 ? player2 : player1
  end

  def opponent_of(player)
    player == player1 ? player2 : player1
  end


end
