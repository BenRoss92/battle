require 'game'

describe Game do

  subject(:game) {described_class.new(player1_double, player2_double)}
  let(:player1_double) {double(:player1, receive_damage: nil, name: 'Ben', hp: 60)}
  let(:player2_double) {double(:player2, receive_damage: nil, name: 'Tom', hp: 60)}

  it 'tells player to receive damage' do
    game.attack
    expect(player2_double).to have_received(:receive_damage)
  end

  it 'gets a name for a player' do
    expect(player1_double).to receive(:name)
    game.get_name(:player_1)

  end

  it 'gets an HP for a player' do
    expect(player1_double).to receive(:hp)
    game.get_hp(:player_1)
  end

  it 'switches turn after attack' do
    game.attack
    expect(game.current_turn).to eq player2_double.name
  end

  it 'player loses game if hp is 0' do
    allow(player1_double).to receive(:hp).and_return(0)
    expect(game.game_over).to be true
  end

end
