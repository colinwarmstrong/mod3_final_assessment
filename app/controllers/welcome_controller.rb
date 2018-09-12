class WelcomeController < ApplicationController
  def index
  end

  def create
    @word_validation_presenter = WordValidationPresenter.new(welcome_params[:word])
  end

  private

  def welcome_params
    params.permit(:word)
  end
end
