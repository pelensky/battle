require 'spec_helper'

feature "losing a game" do

  scenario "player2 loses a game" do
    sign_in_and_play
    10.times do
      click_button("Attack")
      click_button("Go back")
    end
    click_button("Attack")
    expect(page).to have_content "Jack has attacked Elizabeth - Elizabeth loses"
  end

end
