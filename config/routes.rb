Rails.application.routes.draw do

  # root to: 'home#index'
  root to: 'posts#index'

  resources :posts do
    resources :comments
  end

  get 'posts' => 'posts#index'


end
