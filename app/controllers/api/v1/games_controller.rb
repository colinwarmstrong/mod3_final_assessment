class Api::V1::GamesController < ApplicationController
  def show
    render json: game
  end

  private

  def game_params
    params.permit(:game_id)
  end

  def game
    Game.find(params[:game_id])
  end
end
