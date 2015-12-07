Rails.application.routes.draw do
 
  devise_for :users
  
  get 'search/index'
  
  get 'search' => 'alchemy#search'
  
  get "welcome/index"
  
  get "welcome/about"
  
  get "welcome/contact"
  
  #get 'alchemy/show'

  resources :alchemy
  
  resources :users, only: [:update]
  
  root to: 'welcome#index'
  
end