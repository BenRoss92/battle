class Game

  attr_reader :current_turn, :other_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_turn = player1.name
  end

  def other_player
    find_player.name
  end

  def attack
    find_player.receive_damage
    switch_turn
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

  private

  attr_reader :player1, :player2

  def switch_turn
    @current_turn = (@current_turn == player1.name ? player2.name : player1.name)
  end

  def find_player
    @current_turn != @player1.name ? @player1 : @player2
  end

end
