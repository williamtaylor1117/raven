Rails.application.routes.draw do
 
  get 'search/index'

  devise_for :users
  
  get 'search' => 'alchemy#search'
  
  get "alchemy/query"

  get "alchemy/index"

  get "alchemy/create"

  get "welcome/index"
  
  get "welcome/about"
  
  get "welcome/contact"
  
  resources :alchemy
  
  resources :users, only: [:update]
  
  root to: 'welcome#index'
  
end