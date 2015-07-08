Rails.application.routes.draw do
 
  get 'alchemy/index'

  get 'alchemy/query'

  get 'alchemy/persist'

  resources :analyzes
  
  devise_for :users
  
  get 'analyze/index'
  
  get 'welcome/analyze'

  get "welcome/index"
  
  get "welcome/about"
  
  get "welcome/contact"
  
  resources :users, only: [:update]
  
  root to: 'welcome#index'
  
end