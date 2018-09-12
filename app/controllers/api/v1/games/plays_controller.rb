class Api::V1::Games::PlaysController < ApplicationController
  def create
    render json: create_play, status: 201
  end

  private

  def game_params
    params.permit(:game_id, :user_id, :word)
  end

  def create_play
    game.plays.create(user_id: game_params[:user_id], word: game_params[:word])
  end

  def game
    Game.find(game_params[:game_id])
  end
end
