Rails.application.routes.draw do
  # resources :users, only: [:new, :create]
  resources :users, only: [:new, :create]
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get 'welcome', to: 'sessions#welcome'
    get 'authorized', to: 'sessions#page_requires_login'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/login'
  # get 'sessions/welcome'
  # get 'users/new'
  # get 'users/create'
  # root "application#home"
  # resources :posts
  # get '/register', to: "login#register"
  # get '/login', to: "login#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
# Rails.application.routes.draw do
#   resources :users, only: [:new, :create]
#   get 'login', to: 'sessions#new'
#   post 'login', to: 'sessions#create'
#   get 'welcome', to: 'sessions#welcome'
# end