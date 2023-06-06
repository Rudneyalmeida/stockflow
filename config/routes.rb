Rails.application.routes.draw do
  # resources :offers
  # resources :transactions
  # resources :stocks
  # resources :products
  # devise_for :users
  # root to: "pages#home"
  root to: "products#index"
  resources :products do
    collection do
      get :my_products
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
