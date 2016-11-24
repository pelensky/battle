require 'spec_helper'

RSpec.feature "attacks a player" do
  scenario "attacks player 2" do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content("Jack has attacked Elizabeth")
  end

  scenario "reduces player2 hit points" do
    sign_in_and_play
    click_button("Attack")
    click_button("Go back")
    expect(page).not_to have_content("Elizabeth: 60/60 HP")
    expect(page).to have_content("Elizabeth: 50/60 HP")
  end

  scenario "player 2 attacks me" do
    sign_in_and_play
    click_button("Attack")
    click_button("Go back")
    click_button("Attack")
    expect(page).to have_content("Elizabeth has attacked Jack")
    expect(page).not_to have_content("Jack has attacked Elizabeth")
  end

end
