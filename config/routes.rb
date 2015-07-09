Rails.application.routes.draw do
 
  devise_for :users
  
  get 'search' => 'alchemy#search'
  
  get "alchemy/query"

  get "welcome/index"
  
  get "welcome/about"
  
  get "welcome/contact"
  
  resources :alchemy
  
  resources :users, only: [:update]
  
  root to: 'welcome#index'
  
end