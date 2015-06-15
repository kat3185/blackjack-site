require 'spec_helper'

feature 'user can play blackjack' do
  let!(:game) { Game.new("Gandalf") }

  scenario 'page loads' do
    visit '/'
    fill_in "Player name:", with: "Gandalf"
    click_button "Submit"
    visit '/blackjack'
    expect(page).to have_content("Gandalf")
    expect(page).to have_content("#{game.player} was dealt:")
    expect(page).to have_content("Gandalf's Total Score")
  end
  

end
