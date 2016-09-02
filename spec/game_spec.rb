require 'game'

describe Game do
  let(:player1) {double :player1}
  let(:player2) {double :player2, receive_damage: nil}
  subject(:game) {described_class.new(player1, player2)}

  context "#initialize" do
    it "stores player1 object" do
      expect(game.player1).to eq player1
    end

    it "stores player2 object" do
      expect(game.player2).to eq player2
    end
  end

  context '#attack' do
    it "calls the #receive_damage method on the attacked player object" do
      expect(player2).to receive(:receive_damage)
      game.attack
    end

    it 'should #switch the current player' do
      game.attack
      expect(game.current_player).to eq player2
    end
  end
end
