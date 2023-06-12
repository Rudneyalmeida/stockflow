Rails.application.routes.draw do
  resources :offers, only: [:index] do
    collection do
      get :received
    end
  end

  resources :chatrooms, only: [:index, :show]

  resources :trades
  resources :products do
    resources :offers, only: [:new, :create]
    resources :chatrooms, only: [:create]
    collection do
      get :my_products
    end
  end

  devise_for :users
  root to: "products#index"

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
