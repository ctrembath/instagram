Rails.application.routes.draw do

  root to: 'home#index'

  get 'posts' => 'posts#index'


end
