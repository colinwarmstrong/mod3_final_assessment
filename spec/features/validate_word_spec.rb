require 'rails_helper'

describe 'A guest user' do
  context 'visiting /' do
    it 'can click validate word to get information about a valid word' do
      # As a guest user (no sign in necessary)
      # When I visit "/"
      visit root_path
      # And I fill in a text box with "foxes"
      fill_in :word, with: 'foxes'
      # And I click "Validate Word"
      click_on 'Validate Word'
      # Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."
      expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
    end

    it 'can get a message telling them a word is invalid' do
      # As a guest user
      # When I visit "/"
      visit root_path
      # And I fill in a text box with "foxez"
      fill_in :word, with: 'foxez'
      # And I click "Validate Word"
      click_on 'Validate Word'
      # Then I should see a message that says "'foxez' is not a valid word."
      expect(page).to have_content("'foxez' is not a valid word.")
    end
  end
end
