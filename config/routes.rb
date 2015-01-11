Rails.application.routes.draw do

  # root to: 'home#index'
  root to: 'posts#index'

  resources :posts

  get 'posts' => 'posts#index'


end
