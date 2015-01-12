Rails.application.routes.draw do

  devise_for :users
  # root to: 'home#index'
  root to: 'posts#index'

  resources :posts do
    resources :comments
  end

  get 'posts' => 'posts#index'


end
