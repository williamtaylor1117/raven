Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/contact'

  get 'welcome/analyze'

  get 'welcome/analyze'

  get "welcome/index"
  
  get "welcome/about"
  
  get "welcome/contact"
  
  resources :users, only: [:update]
  
  root to: 'welcome#index'
  
end