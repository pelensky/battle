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
      if turn == player1
        @turn = player2
      else
        @turn = player1
      end
    end
  end
