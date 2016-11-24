require "app.rb"
require "spec_helper"

feature "Attacking" do
 scenario "Player 1 wants an attack confirmation" do
   sign_in_and_play
   click_button 'Attack'
   expect(page).to have_content("Dan has attacked Jenna!")
 end

 scenario "Player 2 wants to see how much damage they have done" do
   srand(55)
   sign_in_and_play
   click_button "Attack"
   expect(page).to have_content("15 HP deducted!")
 end

 scenario "press okay to proceed" do
  sign_in_and_play
  attack
  expect(page).to have_content "Dan vs Jenna"
 end

 scenario "Player 2 wants an attack confirmation" do
   sign_in_and_play
   attack
   click_button "Attack"
   expect(page).to have_content("Jenna has attacked Dan!")
 end


 scenario "Player 1 wants to posion Player 2" do
   sign_in_and_play
   click_button "poison"
   expect(page).to have_content("Dan poisoned Jenna!")
 end

 scenario "poison should also press play to proceed" do
   sign_in_and_play
   poison
   expect(page).to have_content "Dan vs Jenna"
 end

 scenario "player 2 has been poisoned and needs to see how much HP it's reduced" do
   sign_in_and_play
   poison
   srand(1234)
   click_button "Attack"
   expect(page).to have_content("Jenna took 10 HP poison damage")
 end
end
