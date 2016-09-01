require 'game'

describe Game do

  subject(:game) {described_class.new(player1, player2)}
  let(:player1) {double(:player1, receive_damage: nil)}
  let(:player2) {double(:player2, receive_damage: nil)}

  it 'tells player to receive damage' do
    game.attack(player1)
    expect(player1).to have_received(:receive_damage)
  end

end
