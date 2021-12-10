Rails.application.routes.draw do
  root :to => "users#index"
  resources :city_guides
  resources :categories
  resources :entries
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
