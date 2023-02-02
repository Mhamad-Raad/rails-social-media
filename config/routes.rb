Rails.application.routes.draw do

  devise_scope :user do
    get '/logout', to: 'sessions#logout', as: :logout
  end
  
  devise_for :users
  root to: "users#index"
  post '/users/:user_id/posts', to: 'posts#create', as: 'post_create'

  # delete '/users/:user_id/posts/:id', to: 'posts#delete', as: 'post_delete'
  # delete '/users/:user_id/posts/:id/comments/:comments_id', to: 'comments#destroy', as: 'comment_delete'

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
  resources :posts, only: [:new, :create, :destroy]
end

