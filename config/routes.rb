Rails.application.routes.draw do
  resources :posts, only: :create
  resource :ratings, only: :create
end
