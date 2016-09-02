require_relative 'player'

class Game

  attr_reader :player1, :player2, :current_player, :other_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def attack
    other_player.receive_damage
    switch_turn
  end

  def switch_turn
    @current_player = (@current_player == player1 ? player2 : player1)
  end

  def other_player
    @current_player != @player1 ? @player1 : @player2
  end

end
