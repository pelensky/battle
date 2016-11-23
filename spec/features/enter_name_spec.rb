 require "app.rb"
 require "spec_helper"

feature "Enter names" do
  scenario "submitting names" do
    visit('/')

    fill_in :player1, with: "Dan"
    fill_in :player2, with: "Jenna"
    click_button "Start"

    expect(page).to have_content("Dan vs Jenna!")
  end
end
