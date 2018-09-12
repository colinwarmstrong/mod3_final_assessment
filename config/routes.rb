Rails.application.routes.draw do
  root "welcome#index"
  post "/", to: "welcome#create"

  namespace :api do
    namespace :v1 do
      get '/games/:game_id', to: 'games#show'
    end
  end
end
