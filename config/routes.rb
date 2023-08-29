Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :adds, only: [] do
    resources :reservations, only: %i[new create edit delete]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
