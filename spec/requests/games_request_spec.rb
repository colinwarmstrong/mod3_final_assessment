require 'rails_helper'

describe 'API Games Requests' do
  context 'GET Requests' do
    it 'GET /api/v1/games/:id' do
    #  When I send a GET request to “/api/v1/games/1”
    get '/api/v1/games/1'

    expect(response).to be_successful

    game = JSON.parse(response.body, symbolize_names: true)

    expect(game[:game_id]).to eq(1)
    expect(game[:scores]).to be_an(Array)

    expect(game[:scores][0][:user_id]).to eq(1)
    expect(game[:scores][0][:score]).to eq(15)

    expect(game[:scores][1][:user_id]).to eq(2)
    expect(game[:scores][1][:score]).to eq(16)

    #  I receive a JSON response as follows:
    #   {
    #   "game_id":1,
    #   "scores": [
    #     {
    #       "user_id":1,
    #       "score":15
    #     },
    #     {
    #       "user_id":2,
    #       "score":16
    #     }
    #   ]
    # }
    end
  end
end
