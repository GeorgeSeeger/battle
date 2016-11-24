require "app.rb"
require "spec_helper"

feature "Attacking" do
 scenario "Player 1 wants an attack confirmation" do
   sign_in_and_play
   click_button 'Attack'
   expect(page).to have_content("Dan has attacked Jenna!")
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
end
