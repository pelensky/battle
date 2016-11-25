class Game

  attr_reader :player1, :player2, :turn

  def self.create(player1, player2)
    @game = Game.new(player1, player2)
  end

  def self.instance
    @game
  end

  def initialize(player1, player2)
    @turn = player1
    @player1 = player1
    @player2 = player2
  end

  def switch_turn
    @turn = turn == player1 ? player2 : player1
  end

  def opponent_of(player)
    player == player1 ? player2 : player1
  end


end
