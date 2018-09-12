class WelcomeController < ApplicationController
  def index
    @word_validation_presenter = WordValidationPresenter.new(welcome_params[:word]) if params[:word]
  end

  def create
    
    redirect_to root_path
  end

  private

  def welcome_params
    params.permit(:word)
  end
end
