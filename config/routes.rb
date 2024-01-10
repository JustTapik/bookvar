Rails.application.routes.draw do
  get 'admin', to: 'admin#index', as: :admin_page
  get 'books_users/buy/:id', to: 'books_users#buy', as: :books_users_buy
  get 'books_users/cancel/:id', to: 'books_users#cancel', as: :books_users_cancel
  resources :books
  root 'home#index'


  get 'home/profile', to: 'home#profile', as: :profile
  get 'home/index'
  get 'home/dashboard'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
