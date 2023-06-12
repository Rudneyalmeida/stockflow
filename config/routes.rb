Rails.application.routes.draw do
  get 'get_company_data', to: 'application#get_company_data'
  resources :offers, only: [:index, :show] do
    collection do
      get :received
    end
    member do
      patch :accept
      patch :reject
    end

  end

  resources :trades
  resources :products do
    resources :offers, only: [:new, :create]
    collection do
      get :my_products
    end
  end

  get "/offers/num_received", to: "offers#num_received"

  devise_for :users
  root to: "products#index"

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
