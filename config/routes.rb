Rails.application.routes.draw do

  # root to: 'home#index'
  root to: 'posts#index'

  get 'posts' => 'posts#index'


end
