class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def attack
    @player2.receive_damage
  end

  def get_name(player)
    if player == :player_1
      @player1.name
    elsif player == :player_2
      @player2.name
    end
  end

  def get_hp(player)
    if player == :player_1
      @player1.hp
    elsif player == :player_2
      @player2.hp
    end
  end

end
