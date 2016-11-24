require "app.rb"
require "spec_helper"

feature "View hit points" do
 scenario "Player 1 wants to view player 2 hit points" do
   sign_in_and_play
   attack
   expect(page).to have_content("Dan has attacked Jenna!")
 end

 scenario "press okay to proceed" do
  sign_in_and_play
  attack
  click_button "ok"
  expect(page).to have_content "Dan vs Jenna"
 end
end
