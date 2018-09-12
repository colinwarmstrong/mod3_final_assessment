require 'rails_helper'

describe Play, type: :model do
  context 'Validations' do
    it { should belong_to :user }
    it { should belong_to :game }
  end

  context "Instance methods" do
    context "#score_word" do
      it "scores the word" do
        play = create(:play, word: "assess")
        expect(play.score).to eq(6)
      end
    end
  end
end
