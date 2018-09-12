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
  end
end
