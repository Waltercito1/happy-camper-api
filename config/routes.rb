Rails.application.routes.draw do
  resources :lists
  resources :comments
  resources :items
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
