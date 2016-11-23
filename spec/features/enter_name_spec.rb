require "app.rb"
require "spec_helper"

RSpec.feature "Battle", :type => :feature do
  scenario "Users start a battle" do
    visit "/start-battle"

    fill_in "Player 1", :with => "Dan"
    fill_in "Player 2", :with => "Jenna"
    click_button "Start Battle"

    expect(page).to have_text("Dan vs Jenna!")
  end
end
