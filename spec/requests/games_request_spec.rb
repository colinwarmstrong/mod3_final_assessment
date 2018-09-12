require 'rails_helper'

describe 'API Games Requests' do
  before :each do
    josh = User.create(id: 1, name: "Josh")
    sal = User.create(id: 2, name: "Sal")

    game = Game.create(id: 1, player_1: josh, player_2: sal)

    josh.plays.create(game: game, word: "sal", score: 3)
    josh.plays.create(game: game, word: "zoo", score: 12)
    sal.plays.create(game: game, word: "josh", score: 14)
    sal.plays.create(game: game, word: "no", score: 2)
  end

  context 'GET Requests' do
    it 'GET /api/v1/games/:id' do
      get '/api/v1/games/1'

      expect(response).to be_successful

      game = JSON.parse(response.body, symbolize_names: true)

      expect(game[:game_id]).to eq(1)
      expect(game[:scores]).to be_an(Array)

      expect(game[:scores][0][:user_id]).to eq(1)
      expect(game[:scores][0][:score]).to eq(15)

      expect(game[:scores][1][:user_id]).to eq(2)
      expect(game[:scores][1][:score]).to eq(16)
    end
  end

  context 'POST Requests' do
    it 'POST /api/v1/games/:id/plays' do
      user_id = 1
      word = 'at'

      post "/api/v1/games/1/plays?user_id=#{user_id}&word=#{word}"

      expect(response.status).to eq(201)

      get '/api/v1/games/1'

      expect(response).to be_successful

      game = JSON.parse(response.body, symbolize_names: true)

      expect(game[:game_id]).to eq(1)
      expect(game[:scores]).to be_an(Array)

      expect(game[:scores][0][:user_id]).to eq(1)
      expect(game[:scores][0][:score]).to eq(17)

      expect(game[:scores][1][:user_id]).to eq(2)
      expect(game[:scores][1][:score]).to eq(16)
    end
  end
end
