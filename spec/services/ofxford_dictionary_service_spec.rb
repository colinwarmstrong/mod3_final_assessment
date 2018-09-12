require 'rails_helper'

describe OxfordDictionaryService do
  it 'returns a 200 status when given a valid word', :vcr do
    service = OxfordDictionaryService.new

    word = 'foxes'

    response = service.word_information(word)

    expect(response.status).to eq(200)
  end

  it 'returns a 404 status when given an invalid word', :vcr do
    service = OxfordDictionaryService.new

    word = 'foxez'

    response = service.word_information(word)

    expect(response.status).to eq(404)
  end
end
