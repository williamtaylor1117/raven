Rails.application.routes.draw do
 
  devise_for :users
  
  get "alchemy/search"

  get "welcome/index"
  
  get "welcome/about"
  
  get "welcome/contact"
  
  resources :alchemy
  
  resources :users, only: [:update]
  
  root to: 'welcome#index'
  
end