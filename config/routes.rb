Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: "users#index"
  get '/users/:user_id', to: "users#detail"

  resources :users do
    resources :posts
  end
end
