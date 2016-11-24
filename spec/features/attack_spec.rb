require 'spec_helper'

RSpec.feature "attacks a player" do
  scenario "attacks player 2" do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content("You have attacked Elizabeth")
  end
end
