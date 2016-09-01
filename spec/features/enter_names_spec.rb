require 'spec_helper'

feature 'entering names' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content('Jonny vs. Ben')
  end
end

feature 'Displaying hitpoints' do
  scenario 'Player 1 can see Player 2 hitpoints' do
    sign_in_and_play
    expect(page).to have_content('60/60 HP')
  end
end
