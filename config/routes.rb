Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :movie_details, only: :index
  root "movie_details#index"
end
