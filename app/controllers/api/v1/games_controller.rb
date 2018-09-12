class Api::V1::GamesController < ApplicationController
  def show
    game = Game.find(params[:game_id])
    render json: game
  end

  private

  def game_params
    params.permit(:game_id)
  end
end
