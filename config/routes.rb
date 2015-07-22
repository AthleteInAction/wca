Rails.application.routes.draw do

  get 'strategy',to: 'strategy#index',as: 'strategy'
  get 'strategy/forecheck',to: 'strategy#forecheck'

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
			resources :comment,path: 'comments'
			resources :user,path: 'users'

    end
  end
  
end