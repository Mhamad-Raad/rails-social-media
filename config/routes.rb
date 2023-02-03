Rails.application.routes.draw do

  devise_scope :user do
    get '/logout', to: 'sessions#logout', as: :logout
  end
  
  devise_for :users
  root to: "users#index"
  post '/users/:user_id/posts', to: 'posts#create', as: 'post_create'

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
end
