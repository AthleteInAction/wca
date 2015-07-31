Rails.application.routes.draw do

  get 'strategy',to: 'strategy#index',as: 'strategy'
    get 'strategy/forecheck',to: 'strategy#forecheck'
    get 'strategy/entry',to: 'strategy#entry'
    get 'strategy/odd-man-rush',to: 'strategy#odd_man_rush'
    get 'strategy/powerplay',to: 'strategy#powerplay'
    get 'strategy/breakout',to: 'strategy#breakout'

  get 'dashboard',to: 'dashboard#index',as: 'dashboard'

  get 'signup/index'

  resources :users
  
  root 'splash#index'

  get '/access/normal',to: 'sessions#new',as: 'login'
  post '/access/normal',to: 'sessions#create',as: 'login_try'
  get '/access/logout',to: 'sessions#destroy',as: 'logout'

  get '/access/signup',to: 'signup#index',as: 'signup'
  post '/access/signup',to: 'signup#create',as: 'new_signup'

  get 'angularjs/templates/:page',to: 'angularjs#index'

  # API
  namespace :api do
    namespace :v1 do

      # API INSERT
			resources :player#,path: 'players'
      put :player,to: 'player#update'
			resources :playlist,path: 'playlists'
      get 'soundcloud/tracks',to: 'soundcloud#tracks'
			resources :soundcloud,path: 'soundcloud'
			resources :comment,path: 'comments'
			resources :user,path: 'users'

    end
  end
  
end