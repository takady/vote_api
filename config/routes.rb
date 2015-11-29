Rails.application.routes.draw do
  root to: 'top#index'
  get '/auth/twitter/callback' => 'users#new'
  get '/auth/facebook/callback' => 'users#new'
  get '/logout' => 'sessions#destroy', as: :logout

  post '/races/vote' => 'races#vote'
  resources :races, only: [:index, :show, :new, :create, :destroy]

  get '/mypage' => 'users#mypage'

  resources :users, only: [:new, :create, :edit, :update, :destroy]

  get '/:username', :to => 'users#show'
end
