Rails.application.routes.draw do
  get 'logins/index'
  root "application#home"
  resources :posts
  # get '/register', to: "login#register"
  # get '/login', to: "login#login"
  get 'login', to: 'login#new'
  get 'login/create', to: 'login#create', as: :create_login
  get 'userPosts/:user_name', to: 'posts#userPosts', as: :user_posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
