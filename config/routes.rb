Rails.application.routes.draw do
  resources :platforms, only: %i[index show]
  resources :developers, only: %i[index show]
  resources :games, only: %i[index show]
end
