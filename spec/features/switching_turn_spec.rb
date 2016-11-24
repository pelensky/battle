require 'spec_helper'
  RSpec.feature 'turn changing' do
    scenario 'player 1\'s turn' do
      sign_in_and_play
      expect(page).not_to have_content("Elizabeth's turn")
      expect(page).to have_content("Jack's turn")
    end


  scenario 'player 1 has attacked player 2, now its player2 turn' do
    sign_in_and_play
    click_button("Attack")
    click_link("Go back")
    expect(page).not_to have_content("Jack's turn")
    expect(page).to have_content("Elizabeth's turn")
  end
end
