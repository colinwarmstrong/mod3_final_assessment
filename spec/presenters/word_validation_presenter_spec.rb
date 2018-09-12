require 'rails_helper'

describe WordValidationPresenter do
  context 'Instance Methods' do
    context '#word_validation' do
      it 'returns the correct message when given a valid word', :vcr do
        word = 'foxes'

        presenter = WordValidationPresenter.new(word)

        message = presenter.word_validation

        expect(message).to eq("'foxes' is a valid word and its root form is 'fox'.")
      end

      it 'returns the correct message when given an invalid word', :vcr do
        word = 'foxez'

        presenter = WordValidationPresenter.new(word)

        message = presenter.word_validation

        expect(message).to eq("'foxez' is not a valid word.")
      end
    end
  end
end
