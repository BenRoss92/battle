require 'spec_helper'

feature 'attacking player 2' do
  scenario 'player 1 attacks player 2' do
    sign_in_and_play
    click_link('Attack')
    expect(page).to have_content('Player 1 attacked Player 2')
  end
end
