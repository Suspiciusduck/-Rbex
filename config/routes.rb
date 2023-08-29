Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :adds do
    resources :reservations, only: %i[new create]
=======
  resources :adds  do
    resources :reservations, only: [new create edit delete]
>>>>>>> b9b323b802b4f7ec374d5d5274388dfa7336704b
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
