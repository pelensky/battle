require "app.rb"
require "spec_helper"

feature "losing" do
  scenario "Player 2 gets to 0 hp and loses" do
    sign_in_and_play
    srand(1234)
    10.times{attack}
    expect(page).to have_content("Dan loses!")
    expect(page).to have_content("Congratulations Jenna!")
  end
end
