require "app.rb"
require "spec_helper"

feature "View hit points" do
 scenario "Player 1 wants to view player 2 hit points" do
   visit('/view-hit-points')

   expect(page).to have_content("Player 1: 6, Player 2: 11")
 end
end
