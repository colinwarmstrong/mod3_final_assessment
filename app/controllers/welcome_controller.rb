class WelcomeController < ApplicationController
  def index
    if welcome_params[:word]
      @word_validation_presenter = WordValidationPresenter.new(welcome_params[:word])
    else
      @word_validation_presenter = WordValidationPresenter.new('welcome')
    end
  end

  private

  def welcome_params
    params.permit(:word)
  end
end
