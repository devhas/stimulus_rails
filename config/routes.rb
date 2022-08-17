Rails.application.routes.draw do
  resources :employments
  get 'home/index'
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
