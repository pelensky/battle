require 'spec_helper'
RSpec.feature "viewing all the hit points" do
  scenario "player 1 wants to view player 2 hit points" do
    sign_in_and_play
    expect(page).to have_content("Elizabeth: 60/60 HP")
  end

  scenario "view my own hit points" do
    sign_in_and_play
    expect(page).to have_content("Jack: 60/60 HP")
  end
end
