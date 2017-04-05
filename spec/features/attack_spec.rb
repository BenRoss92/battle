require 'spec_helper'

feature 'attacking player 2' do
  before(:each) do
    sign_in_and_play
    find(:xpath, "//a[@href='/attack']").click
  end
  scenario 'player 1 attacks player 2' do
    expect(page).to have_content('Jonny attacked Ben')
  end

  scenario "reduces player 2's HP by 10" do
    expect(page).to have_content('50/60 HP')
  end
end
