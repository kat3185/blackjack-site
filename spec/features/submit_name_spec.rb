require 'spec_helper'

feature 'user submits name to start game' do
  scenario 'user submits their name' do
    visit '/'
    fill_in "Player name:", with: "Gandalf"
    click_button "Submit"
    expect(page).to have_content("Gandalf")
  end

end
