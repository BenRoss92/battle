require 'spec_helper'

feature 'hit points' do
  scenario 'shows the hit point of player 2' do
    sign_in_and_play
    expect(page).to have_content "Erce's hitpoint is 20"
  end

  scenario 'a player has 0 hp' do
    sign_in_and_play
    click_button('Attack')
    click_link('OK')
    click_button('Attack')
    click_link('OK')
    click_button('Attack')
    expect(page).to have_content 'Erce lost!'
  end
end
