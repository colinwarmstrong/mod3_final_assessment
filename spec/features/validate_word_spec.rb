require 'rails_helper'

describe 'A guest user' do
  context 'visiting /' do
    it "can click 'Validate Word' to get information about a valid word" do
      visit root_path

      fill_in :word, with: 'foxes'

      click_on 'Validate Word'

      expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
    end

    it 'can get a message telling them a word is invalid' do
      visit root_path

      fill_in :word, with: 'foxez'

      click_on 'Validate Word'

      expect(page).to have_content("'foxez' is not a valid word.")
    end
  end
end
