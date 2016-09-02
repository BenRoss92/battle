require 'player'

describe Player do
  subject(:player1) {described_class.new("player1")}
  subject(:player2) {described_class.new("player2")}
  let(:game) {double :game}

  context '#name' do
    it 'should give the player name' do
      expect(player1.name).to eq("player1")
    end
  end

  context '#receive_damage' do
    it 'reduces the hit points by 10' do
      expect{player2.receive_damage}.to change{player2.points}.by(-10)
    end
  end
end
