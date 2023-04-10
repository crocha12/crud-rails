Rails.application.routes.draw do
  resources :activities
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "activities#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
