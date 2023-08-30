Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :adds do
    resources :reservations, only: %i[new create]
  end

  get '/search', to: 'search#index', as: 'search'
  # Defines the root path route ("/")
  # root "articles#index"
end
