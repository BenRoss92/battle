require 'player'

describe Player do

  subject(:player) {described_class.new('Jonny')}

  it 'has a name' do
    expect(player.name).to eq 'Jonny'
  end



end
