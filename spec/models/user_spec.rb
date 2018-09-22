require 'rails_helper'

describe User, type: :model do
  context 'Validations' do
    it { should have_many :plays }
  end

  context 'Instance Methods' do
    it '#score' do
      josh = User.create(id: 1, name: "Josh")
      sal  = User.create(id: 2, name: "Sal")

      game = Game.create(player_1: josh, player_2: sal)

      josh.plays.create(game: game, word: "sal", score: 3)
      josh.plays.create(game: game, word: "zoo", score: 12)
      sal.plays.create(game: game, word: "josh", score: 14)
      sal.plays.create(game: game, word: "no", score: 2)

      expect(josh.score).to eq(15)
      expect(sal.score).to eq(16)
    end
  end
end
