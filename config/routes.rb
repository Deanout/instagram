Rails.application.routes.draw do
  resources :posts
  root 'posts#index'
  get '/u/:id', to: 'user#index', as: :user
  get '/u/:id/channel', to: 'user#channel', as: :user_channel
  get '/u/:id/saved', to: 'user#saved', as: :user_saved
  get '/u/:id/tagged', to: 'user#tagged', as: :user_tagged

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
