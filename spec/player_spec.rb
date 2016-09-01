require 'player'

describe Player do

  subject(:player) {described_class.new('Jonny')}

  it 'has a name' do
    expect(player.name).to eq 'Jonny'
  end

  context 'player 2 is attacked by player 1' do
    it 'reduces player 2 HP by 10' do
      expect{player.attack}.to change{player.hp}.by(-10)
    end
  end

end
