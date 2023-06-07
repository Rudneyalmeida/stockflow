Rails.application.routes.draw do
  resources :offers
  resources :trades
  resources :products do
    collection do
      get :my_products
    end
  end
  devise_for :users
  root to: "products#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
