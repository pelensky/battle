require 'spec_helper'

RSpec.feature 'switches turns' do

  scenario 'initially player 1s turn' do
      sign_in_and_play
      expect(page).not_to have_content("Elizabeth's turn")
      expect(page).to have_content("Jack's turn")
  end

  scenario 'after player 1 has attacked' do
    sign_in_and_play
    click_button("Attack")
    click_button("Go back")
    expect(page).not_to have_content("Jack's turn")
    expect(page).to have_content("Elizabeth's turn")
  end
end
