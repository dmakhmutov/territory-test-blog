Rails.application.routes.draw do
  resources :posts, only: :create
  resource :ratings, only: :create
  resource :posts_top, only: :show
end
