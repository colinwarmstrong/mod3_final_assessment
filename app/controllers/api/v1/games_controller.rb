class Api::V1::GamesController < ApplicationController
  def show
    render json: game
  end

  private

  def game_params
    params.permit(:game_id)
  end

  def game
    @game ||= Game.find(game_params[:game_id])
  end
end
