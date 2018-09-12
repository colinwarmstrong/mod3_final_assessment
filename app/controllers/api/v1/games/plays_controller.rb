class Api::V1::Games::PlaysController < ApplicationController
  def create
    game = Game.find(game_params[:game_id])
    play = game.plays.create(user_id: game_params[:user_id], word: game_params[:word])

    render json: play, status: 201
  end

  private

  def game_params
    params.permit(:game_id, :user_id, :word)
  end
end
